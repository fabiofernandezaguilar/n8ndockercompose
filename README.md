# n8ndockercompose


## ▶️ Cómo iniciar el entorno

```bash
docker compose -f [filename_dockercompose.yml] up -d

docker compose -f docker-compose.yml up -d
```

## ▶️ Cómo detener el destruir los comtenedores

```bash
docker compose -f [filename_dockercompose.yml] down -v

docker compose -f docker-compose.yml down -v
```

## Cómo actualizar la versión de la imagen de docker y levantar los servicios del docker-compouse. Con esta instrucción se actualizaran solamemento los servicicos que tiene una nueva versión, por lo que no todos los servicios se veran impactados. 

```bash

docker-compose pull && docker-compose up -d



## ngrok para que el servicios de N8N esta expuesto desde local a internet 
'''' URL actual: https://yadira-nonextant-fascinatingly.ngrok-free.dev/home/workflows
'''' para levantar ngrok desde la terminal y habilitar el servicio free 

``` bash
ngrok http 5678 
```

### Instalación y configuración de Ngrok 
brew install ngrok
ngrok config add-authtoken 34IfMwsWEDKpAt7YENCfkcnzsS7_3KYVWtWgqxgChuh7T9PuA
ngrok http [puerto a exponer por el gateway]
