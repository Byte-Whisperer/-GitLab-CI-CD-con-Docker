# 🚀 Configuración de GitLab CE y GitLab Runner con Docker Compose

Este tutorial te guiará paso a paso en la configuración de **GitLab CE** y **GitLab Runner** utilizando **Docker Compose**.

## 📌 Temas cubiertos
1️⃣ Instalación de **GitLab CE** y **GitLab Runner** con Docker  
2️⃣ Configuración del **GitLab Runner**  
3️⃣ Configuración de un **pipeline sencillo en GitLab CI/CD**  

---

## 🛠 Comandos utilizados

### 🔹 **Iniciar GitLab y GitLab Runner**
```bash
docker-compose --env-file .env.local up -d
```

### 🔹 **Detener y eliminar los contenedores**
```bash
docker-compose down
```

<details>
  <summary>📋 Copiar todos los comandos</summary>

  ```bash
  docker-compose --env-file .env.local up -d
  docker-compose down
  ```
  
</details>

---

## 📂 Estructura del Proyecto
```
📦 -GitLab-CI-CD-con-Docker
 ┣ 📜 docker-compose.yml   # Configuración de GitLab y GitLab Runner
 ┣ 📜 .env.local           # Variables de entorno
 ┣ 📜 README.md            # Documentación del proyecto
 ┗ 📁 pipeline-test/       # Ejemplo de pipeline GitLab CI/CD
```

---

🔗 **Repositorio:** [GitHub](https://github.com/Byte-Whisperer/-GitLab-CI-CD-con-Docker)

---

⭐ ¡Espero sea de utilidad para la comunidad!  
