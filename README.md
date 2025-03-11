# Teacher Ranker - Backend

Este es el backend para la aplicación Teacher Ranker, una plataforma que permite a los estudiantes calificar y revisar a sus profesores universitarios.

## Estructura de la Base de Datos

El proyecto utiliza Prisma ORM con PostgreSQL. La estructura de la base de datos incluye las siguientes entidades principales:

### Entidades Principales

- **User**: Usuarios de la plataforma
- **Professor**: Profesores que pueden ser calificados
- **University**: Universidades a las que pertenecen los profesores y usuarios
- **Faculty**: Facultades dentro de las universidades
- **Course**: Cursos impartidos por los profesores
- **Review**: Reseñas y calificaciones de los profesores
- **Administrator**: Administradores del sistema
- **Tag**: Etiquetas para categorizar profesores y cursos

### Relaciones

- Un profesor puede pertenecer a varias universidades y facultades
- Un profesor puede impartir varios cursos
- Un usuario puede crear múltiples reseñas (máximo una por profesor)
- Una universidad tiene muchas facultades
- Un usuario pertenece a una universidad

### Diagrama de la Base de Datos

```mermaid
erDiagram
    User {
        int id PK
        string fullName
        string username UK
        string email UK
        string password
        datetime createdAt
        boolean verificationStatus
        string accountStatus
        int universityId FK
    }

    Professor {
        int id PK
        string fullName
        float averageRating
        int reviewCount
    }

    University {
        int id PK
        string name
        string acronym
        string location
        string department
        int totalProfessorsCount
        float generalAverageRating
    }

    Faculty {
        int id PK
        string name
        int universityId FK
    }

    Course {
        int id PK
        string name
    }

    Review {
        int id PK
        float overallRating
        float teachingQuality
        float difficultyLevel
        boolean mandatoryAttendance
        float classInterest
        string detailedComment
        string gradeObtained
        datetime createdAt
        string visibilityStatus
        string reportStatus
        int userId FK
        int professorId FK
        int courseId FK
    }

    Administrator {
        int id PK
        string username UK
        string password
        string accessLevel
    }

    Tag {
        int id PK
        string name UK
        string type
    }

    ProfessorUniversity {
        int professorId PK,FK
        int universityId PK,FK
    }

    ProfessorFaculty {
        int professorId PK,FK
        int facultyId PK,FK
    }

    ProfessorCourse {
        int professorId PK,FK
        int courseId PK,FK
    }

    ProfessorTag {
        int professorId PK,FK
        int tagId PK,FK
    }

    User ||--o{ Review : "creates"
    User }o--|| University : "belongs to"
    Professor ||--o{ Review : "receives"
    Professor ||--o{ ProfessorUniversity : "belongs to"
    Professor ||--o{ ProfessorFaculty : "belongs to"
    Professor ||--o{ ProfessorCourse : "teaches"
    Professor ||--o{ ProfessorTag : "has"
    University ||--o{ ProfessorUniversity : "has"
    University ||--o{ Faculty : "has"
    Faculty ||--o{ ProfessorFaculty : "has"
    Course ||--o{ ProfessorCourse : "has"
    Course ||--o{ Review : "is rated in"
    Tag ||--o{ ProfessorTag : "categorizes"
```

## Requisitos Previos

- Node.js (v16 o superior)
- PostgreSQL
- Yarn o npm

## Configuración del Proyecto

1. Clona el repositorio:

```bash
git clone https://github.com/S4vi0r17/teacher-ranker--backend.git
cd teacher-ranker--backend
```

2. Instala las dependencias:

```bash
yarn install
```

3. Configura las variables de entorno:

   - Crea un archivo `.env` en la raíz del proyecto
   - Añade la URL de conexión a tu base de datos PostgreSQL:

   ```
   DATABASE_URL="postgresql://usuario:contraseña@localhost:5432/teacher_ranker_db?schema=public"
   ```

4. Genera el cliente Prisma:

```bash
yarn prisma generate
```

5. Ejecuta las migraciones para crear la estructura de la base de datos:

```bash
yarn prisma migrate dev --name init
```

## Gestión de la Base de Datos

### Resetear la Base de Datos

Para eliminar todos los datos y recrear la estructura de la base de datos:

```bash
yarn db:reset
```

Este comando:

- Elimina todas las tablas existentes
- Recrea la estructura de la base de datos según el esquema de Prisma
- Prepara la base de datos para ser poblada con datos de prueba

### Poblar la Base de Datos con Datos de Prueba

Para insertar datos de prueba en la base de datos:

```bash
yarn db:seed
```

Este comando:

- Elimina cualquier dato existente
- Reinicia las secuencias de autoincremento
- Inserta datos de prueba para todas las entidades
- Crea relaciones entre las entidades
- Actualiza estadísticas como promedios de calificaciones

## Ejecutar el Proyecto

````bash
# Modo desarrollo
yarn start:dev

# Modo producción
yarn start:prod

## Estructura del Proyecto

- `prisma/`: Contiene el esquema de Prisma y scripts relacionados con la base de datos
  - `schema.prisma`: Define la estructura de la base de datos
  - `seed.sql`: Script SQL para poblar la base de datos con datos de prueba
  - `seed.js`: Script Node.js para ejecutar el seed SQL
  - `reset-db.js`: Script para resetear completamente la base de datos

- `src/`: Código fuente de la aplicación
  - `controllers/`: Controladores de la API
  - `services/`: Servicios de negocio
  - `dto/`: Objetos de transferencia de datos
  - `entities/`: Entidades del dominio
  - `middleware/`: Middleware personalizado

## Comandos Disponibles

```bash
# Iniciar en modo desarrollo
yarn start:dev

# Compilar el proyecto
yarn build

# Ejecutar pruebas
yarn test

# Ejecutar pruebas e2e
yarn test:e2e

# Resetear la base de datos
yarn db:reset

# Poblar la base de datos con datos de prueba
yarn db:seed
````

## Licencia

No sé
