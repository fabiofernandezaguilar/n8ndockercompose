# 1. PostgreSQL Local:

Asegúrate de que tu PostgreSQL local esté configurado para aceptar conexiones desde Docker (y más tarde, desde Kubernetes). Esto podría implicar editar pg_hba.conf para permitir conexiones desde host.docker.internal (para Docker Desktop) o la subred de tu clúster de Kubernetes.

Necesitarás crear un usuario y una base de datos para n8n en tu instancia de PostgreSQL.

CREATE USER n8n_user WITH PASSWORD 'tu_contraseña_segura';
CREATE DATABASE n8n_db OWNER n8n_user;
-- (Opcional, pero recomendado) Conéctate a n8n_db y crea un schema dedicado si quieres
-- \c n8n_db
-- CREATE SCHEMA n8n_schema AUTHORIZATION n8n_user;


# 2. N8N_ENCRYPTION_KEY: 
Esta es una variable CRUCIAL. Es una cadena aleatoria que n8n utiliza para encriptar credenciales. Debes generarla una vez y guardarla de forma segura. Si la pierdes, no podrás desencriptar las credenciales guardadas en tus workflows. Puedes generar una con:
openssl rand -hex 32
valor generado: 
077be3dce2d7aa423e6a69b7244a6680c3e1f2079b892a37808509f448ddf532

# 3. WEBHOOK_URL: 
Para que los webhooks funcionen correctamente, n8n necesita saber su URL pública. En desarrollo local será http://localhost:5678/, pero en Kubernetes será la URL de tu Ingress o LoadBalancer.

# 4. Volúmenes en macOS: 
Los volúmenes locales en macOS funcionarán bien con Docker Desktop. Para Kubernetes (si usas Minikube/Kind localmente), la gestión de volúmenes hostPath puede ser un poco más compleja, ya que el "host" es la VM de Minikube, no directamente tu macOS.

# 5: Crear el directorio de volúmen
mkdir -p ~/.n8n_local_data

# 6. Ejecutar el contenedor 
docker-compose up -d

# 7. Para detener el contenedor 
docker-compose down -v

# 8. Al levantar el contenedor las credenciales son 
email: @datastrategys.com
password: 9cyXYGevyxScdvh
