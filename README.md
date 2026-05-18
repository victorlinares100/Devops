# Prueba 2 - DevOps (Victor Linares, Gabriel Jeria , Isak Chacana )

## Requisitos previos
- Docker Desktop instalado
- Git instalado

## Cómo ejecutar localmente
1. Clonar el repositorio:
git clone https://github.com/victorlinares100/Devops.git
cd Devops

2. Crear el archivo .env en la raíz con las variables:
MYSQL_ROOT_PASSWORD=admin123
MYSQL_DATABASE=tienda_perritos
MYSQL_USER=alumno
MYSQL_PASSWORD=alumno123
DB_ENDPOINT=db
DB_PORT=3306
DB_NAME=tienda_perritos
DB_USERNAME=alumno
DB_PASSWORD=alumno123

3. Levantar todos los servicios:
docker-compose up --build

4. Acceder en el navegador:
- Frontend: http://localhost
- Swagger Ventas: http://localhost:3001/swagger-ui.html
- Swagger Despachos: http://localhost:3002/swagger-ui.htm

## Estructura del proyecto
<img width="463" height="157" alt="image" src="https://github.com/user-attachments/assets/19078489-485b-4e45-9ee3-05ba2acad620" />


## Pipeline CI/CD
Cada push a la rama deploy activa automáticamente:
1. Build de la imagen Docker
2. Push a Amazon ECR
3. Deploy en EC2 via AWS SSM




