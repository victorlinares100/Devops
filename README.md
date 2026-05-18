# Prueba 2 - DevOps (Victor Linares, Gabriel Jeria , Isak Chacana )

# 1 Contenedorización del Frontend y Backend

Para este proyecto se crearon Dockerfiles para cada servicio usando multi-stage build, lo que significa que se usan dos etapas: una para compilar/construir y otra más liviana para ejecutar. Esto reduce el tamaño final de la imagen y mejora la seguridad.

**Frontend:** Se usa Node 20 para construir la aplicación React con Vite, y luego Nginx Alpine para servirla. Corre con un usuario no root llamado nginx.

**Backend Ventas:** Se usa Maven para compilar el JAR de Spring Boot, y luego JRE Alpine para ejecutarlo. Corre con un usuario no root llamado appuser.

**Backend Despachos:** Igual que Ventas pero expone el puerto 8081.

**Base de datos:** Usa la imagen oficial de MySQL 8 con un script init.sql que inicializa la base de datos automáticamente.

El docker-compose.yml levanta los 4 servicios juntos en una red interna llamada tienda-net, con las siguientes variables de entorno, puertos y volúmenes: 
DB 3306 MySQL con volumen persistente 
Backend Ventas 3001 Spring Boot conectado a DB 
Backend Despachos 3002 Spring Boot conectado a DB
Frontend 80 React servido por Nginx


**Persistencia de datos**
La persistencia se aplica en el contenedor de la base de datos MySQL, usando un named volume llamado mysql_data que guarda los datos en /var/lib/mysql.
Se eligió named volume por sobre bind mount porque:

No depende de rutas del sistema host
Docker gestiona su ciclo de vida automáticamente
Es más portable entre entornos (local y EC2)

Cuando el contenedor se reinicia, los datos siguen ahí porque están guardados en el volumen, no dentro del contenedor. Esto garantiza que la información de la tienda no se pierda ante reinicios o actualizaciones.


**Pipeline CI/CD**
Se implementaron 3 pipelines en GitHub Actions (frontend, backend y db) que se activan automáticamente con cada push a la rama deploy.
El flujo de cada pipeline es:
1. Build Se construye la imagen Docker del servicio correspondiente.
2. Push  La imagen se sube a Amazon ECR (Elastic Container Registry), el registro privado de AWS.
3. Deploy  Via AWS SSM se envía un comando a la instancia EC2 para que descargue la nueva imagen y reinicie el contenedor automáticamente.
Las credenciales y variables sensibles se manejan mediante GitHub Secrets, nunca se escriben directamente en el código:


