# Configuración para Kubernetes

Esta parte es más compleja. Asumiré que tienes un clúster de Kubernetes (Minikube, Kind para local, o uno en la nube) y kubectl configurado.

# Puntos Clave para Kubernetes:

Acceso a PostgreSQL: Si tu PostgreSQL sigue siendo local en tu Mac, el clúster de Kubernetes (especialmente uno local como Minikube) necesitará una forma de acceder a él. Esto generalmente implica usar la IP de tu Mac en la red local, y asegurar que el firewall de tu Mac permite conexiones desde la subred de IPs de los Pods de Kubernetes. Para producción, se recomienda una base de datos gestionada o una instancia de PostgreSQL dentro de Kubernetes.

Secretos: Las contraseñas y la N8N_ENCRYPTION_KEY deben almacenarse como Secretos de Kubernetes.

ConfigMaps: Configuraciones no sensibles.

PersistentVolume (PV) y PersistentVolumeClaim (PVC): Para el directorio /home/node/.n8n. En un clúster de nube, usarías StorageClasses como gp2 (AWS), standard (GCP), azure-disk. Para pruebas locales con Minikube, puedes usar hostPath, pero recuerda que el path es dentro de la VM de Minikube.

Deployment: Para gestionar los Pods de n8n.

Service: Para exponer n8n, típicamente de tipo LoadBalancer (en la nube) o NodePort (para pruebas locales).

HorizontalPodAutoscaler (HPA): Para el autoescalado.

(Opcional pero recomendado para producción) Ingress: Para gestionar el acceso HTTP/S, SSL, y routing.

Archivos YAML para Kubernetes:

1. n8n-secret.yaml

apiVersion: v1
kind: Secret
metadata:
  name: n8n-secret
  namespace: n8n # Opcional, pero bueno si usas un namespace dedicado
type: Opaque
stringData: # Usa stringData para no tener que codificar en base64 manualmente
  DB_POSTGRESDB_PASSWORD: "tu_contraseña_segura" # ¡CAMBIAR ESTO!
  N8N_ENCRYPTION_KEY: "TU_CLAVE_DE_ENCRIPTACION_AQUI" # ¡CAMBIAR ESTO!
Use code with caution.
Yaml
2. n8n-configmap.yaml

apiVersion: v1
kind: ConfigMap
metadata:
  name: n8n-config
  namespace: n8n # Opcional
data:
  DB_TYPE: "postgresdb"
  # ¡IMPORTANTE! Ajusta DB_POSTGRESDB_HOST a la IP/hostname de tu Postgres
  # accesible desde el clúster de K8s.
  # Si es tu Mac y Minikube, será la IP de tu Mac en la LAN.
  DB_POSTGRESDB_HOST: "192.168.1.X" # EJEMPLO: IP de tu Mac en la LAN
  DB_POSTGRESDB_PORT: "5432"
  DB_POSTGRESDB_DATABASE: "n8n_db"
  DB_POSTGRESDB_USER: "n8n_user"
  DB_POSTGRESDB_SCHEMA: "public" # O el schema que hayas creado

  N8N_HOST: "n8n.tu-dominio.com" # Cambia esto por tu URL de producción
  WEBHOOK_URL: "https://n8n.tu-dominio.com/" # Cambia esto por tu URL de producción
  GENERIC_TIMEZONE: "America/Mexico_City" # Ajusta a tu zona horaria
  N8N_DIAGNOSTICS_ENABLED: "false"

  # Para escalar con múltiples réplicas, 'queue' mode es más robusto.
  # Necesitarías configurar Redis y tener distintos Deployments para 'main' (workers), 'webhook'.
  # Para este ejemplo inicial, mantenemos 'main' para simplicidad.
  EXECUTIONS_MODE: "main"
  # EXECUTIONS_PROCESS: "main" # Si EXECUTIONS_MODE fuera 'queue'
Use code with caution.
Yaml
3. n8n-pvc.yaml (PersistentVolumeClaim)
Si usas un proveedor de nube, podrías omitir el PV y solo definir el PVC con un storageClassName adecuado.
Para pruebas locales (Minikube/Kind) con hostPath (el path es DENTRO de la VM del nodo de K8s):

# --- PersistentVolume (PV) - Solo para 'hostPath' en Minikube/Kind ---
# En un entorno de nube, tu StorageClass se encargaría de esto.
# Asegúrate que el path /mnt/n8n_data_k8s exista en el nodo de Minikube.
# Puedes usar `minikube ssh` y `sudo mkdir -p /mnt/n8n_data_k8s && sudo chmod 777 /mnt/n8n_data_k8s`
apiVersion: v1
kind: PersistentVolume
metadata:
  name: n8n-data-pv
  namespace: n8n # Opcional
  labels:
    type: local # Para que el PVC lo encuentre
spec:
  storageClassName: manual # O el nombre de tu StorageClass si tienes una específica
  capacity:
    storage: 5Gi # Ajusta el tamaño
  accessModes:
    - ReadWriteOnce # Típico para datos de una aplicación
  hostPath:
    path: "/mnt/n8n_data_k8s" # Path DENTRO de la VM del nodo de Minikube/Kind

---
# --- PersistentVolumeClaim (PVC) ---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: n8n-data-pvc
  namespace: n8n # Opcional
spec:
  storageClassName: manual # Debe coincidir con el PV o ser un SC que aprovisione dinámicamente
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 5Gi # Debe ser menor o igual a la capacidad del PV
  # selector: # Descomentar si quieres ser específico con el PV
  #   matchLabels:
  #     type: local
Use code with caution.
Yaml
Nota sobre hostPath en Minikube en macOS: Para que /mnt/n8n_data_k8s dentro de la VM de Minikube persista datos en tu macOS, necesitarías montar un directorio de tu macOS en la VM de Minikube al iniciarla, por ejemplo:
minikube start --mount --mount-string="/Users/tu_usuario/n8n_k8s_data_on_mac:/mnt/n8n_data_k8s"

4. n8n-deployment.yaml

apiVersion: apps/v1
kind: Deployment
metadata:
  name: n8n-deployment
  namespace: n8n # Opcional
  labels:
    app: n8n
spec:
  replicas: 2 # Comienza con 2 Pods para redundancia
  selector:
    matchLabels:
      app: n8n
  template:
    metadata:
      labels:
        app: n8n
    spec:
      containers:
      - name: n8n
        image: docker.n8n.io/n8nio/n8n:latest # Considera fijar una versión específica
        imagePullPolicy: IfNotPresent
        ports:
        - name: http
          containerPort: 5678
          protocol: TCP
        envFrom:
        - configMapRef:
            name: n8n-config
        - secretRef:
            name: n8n-secret
        # env: # Variables adicionales o para sobrescribir ConfigMap/Secret
        #   - name: NODE_ENV
        #     value: "production"
        resources:
          requests: # Mínimos garantizados
            cpu: "250m" # 0.25 CPU core
            memory: "512Mi" # 512 Mebibytes
          limits: # Máximos que puede usar
            cpu: "1" # 1 CPU core
            memory: "2Gi" # 2 Gibibytes
        volumeMounts:
        - name: n8n-data
          mountPath: /home/node/.n8n
        livenessProbe: # Para verificar si el contenedor está vivo
          httpGet:
            path: /healthz # n8n tiene un endpoint de health check
            port: http
          initialDelaySeconds: 60
          periodSeconds: 30
          timeoutSeconds: 5
          failureThreshold: 3
        readinessProbe: # Para verificar si el contenedor está listo para recibir tráfico
          httpGet:
            path: /healthz
            port: http
          initialDelaySeconds: 30
          periodSeconds: 10
          timeoutSeconds: 5
          failureThreshold: 3
      volumes:
      - name: n8n-data
        persistentVolumeClaim:
          claimName: n8n-data-pvc
Use code with caution.
Yaml
5. n8n-service.yaml

apiVersion: v1
kind: Service
metadata:
  name: n8n-service
  namespace: n8n # Opcional
  labels:
    app: n8n
spec:
  type: LoadBalancer # Para proveedores de nube. Para Minikube, `minikube tunnel` o usa NodePort.
  # type: NodePort # Alternativa para pruebas locales si LoadBalancer es complicado
  selector:
    app: n8n # Debe coincidir con las etiquetas de los Pods del Deployment
  ports:
  - name: http
    protocol: TCP
    port: 80 # Puerto externo del LoadBalancer
    targetPort: http # Nombre del puerto en el Deployment/Pod (5678)
  # Si usas NodePort:
  # nodePort: 30678 # Puerto en el que se expondrá en cada nodo (ej: 30000-32767)
Use code with caution.
Yaml
6. n8n-hpa.yaml (HorizontalPodAutoscaler)

apiVersion: autoscaling/v2 # o v2beta2 para clusters más antiguos
kind: HorizontalPodAutoscaler
metadata:
  name: n8n-hpa
  namespace: n8n # Opcional
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: n8n-deployment # Nombre de tu Deployment
  minReplicas: 2 # Mínimo de Pods (igual a tu `replicas` en Deployment)
  maxReplicas: 5 # Máximo de Pods a los que escalará
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 70 # Escalar cuando el uso promedio de CPU supere el 70%
  # También puedes escalar por memoria u otras métricas personalizadas
  # - type: Resource
  #   resource:
  #     name: memory
  #     target:
  #       type: AverageValue # O Utilization
  #       averageValue: 1Gi # Escalar si el uso promedio de memoria supera 1Gi por Pod
  behavior: # Opcional: Controla la velocidad de escalado/desescalado
    scaleDown:
      stabilizationWindowSeconds: 300 # Espera 5 min antes de desescalar
      policies:
      - type: Percent
        value: 100 # Puede reducir el 100% de los pods necesarios a la vez (hasta minReplicas)
        periodSeconds: 60
      - type: Pods
        value: 2 # O reduce 2 pods a la vez
        periodSeconds: 60
      selectPolicy: Max # Usa la política que permita el desescalado más rápido
    scaleUp:
      stabilizationWindowSeconds: 0 # Escala inmediatamente si es necesario
      policies:
      - type: Percent
        value: 100 # Puede aumentar un 100% de los pods necesarios a la vez
        periodSeconds: 15
      - type: Pods
        value: 4 # O aumenta 4 pods a la vez
        periodSeconds: 15
      selectPolicy: Max # Usa la política que permita el escalado más rápido
Use code with caution.
Yaml
Para aplicar en Kubernetes:

Crea un namespace (opcional pero recomendado):

kubectl create namespace n8n
Use code with caution.
Bash
Si creas un namespace, añade namespace: n8n a los metadata de todos los archivos YAML y usa kubectl apply -n n8n -f <archivo.yaml>.

Aplica los archivos YAML (en orden o todos juntos):

# Si no usas namespace:
kubectl apply -f n8n-secret.yaml
kubectl apply -f n8n-configmap.yaml
kubectl apply -f n8n-pvc.yaml # Aplicar el PV antes si lo definiste explícitamente
kubectl apply -f n8n-deployment.yaml
kubectl apply -f n8n-service.yaml
kubectl apply -f n8n-hpa.yaml

# O todos de una vez si están en un directorio:
# kubectl apply -f ./ruta/a/tus/archivos-k8s/ -n n8n (si usas namespace)
Use code with caution.
Bash
Verifica el estado:

kubectl get pods -n n8n -w # Ver Pods (-w para observar cambios)
kubectl get svc -n n8n      # Ver Servicios (busca la IP externa del LoadBalancer)
kubectl get pvc -n n8n      # Ver PVC
kubectl get hpa -n n8n      # Ver HPA
kubectl logs -f <nombre-del-pod> -n n8n # Ver logs de un Pod
Use code with caution.
Bash
Acceso:

Si usas type: LoadBalancer y estás en un proveedor de nube, espera a que se aprovisione una IP externa.

Si usas type: LoadBalancer con Minikube, ejecuta minikube tunnel en otra terminal.

Si usas type: NodePort, accede vía http://<IP-de-un-nodo-K8s>:<NodePort>. Con Minikube: minikube service n8n-service -n n8n --url.

Consideraciones Adicionales para Producción en Kubernetes:

Ingress Controller: Para gestionar el tráfico HTTP/S, terminación SSL, y routing basado en host/path. (Ej: Nginx Ingress, Traefik). Configurarías N8N_HOST y WEBHOOK_URL con el dominio público que apunta a tu Ingress.

Base de Datos Gestionada: Usar RDS, Cloud SQL, Azure Database for PostgreSQL en lugar de una instancia auto-gestionada es más robusto.

Almacenamiento Persistente: Usa StorageClasses apropiadas de tu proveedor de nube para los PVCs.

Monitorización y Logging: Integra con Prometheus/Grafana para métricas y ELK/EFK Stack para logs.

Modo queue de n8n: Para escalar de forma más granular, puedes configurar n8n en EXECUTIONS_MODE=queue. Esto requiere una instancia de Redis y te permite tener Deployments separados para:

EXECUTIONS_PROCESS=main: Los "workers" que ejecutan los workflows. Puedes escalar estos independientemente.

EXECUTIONS_PROCESS=webhook: Los procesos que reciben los webhooks y los ponen en cola.

Un Pod principal de n8n para la UI y la API (sin EXECUTIONS_PROCESS o con main y sin consumir de la cola principal).

Seguridad: NetworkPolicies, RBAC, PodSecurityPolicies (o el nuevo Pod Security Admission).

Esta configuración te da una base sólida. Recuerda probar exhaustivamente y ajustar los recursos (requests/limits) y los parámetros del HPA según la carga real de tus workflows. ¡Mucha suerte con tu nueva fuente de ingresos!