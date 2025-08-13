# CollaboTask API

## Overview
CollaboTask API is a robust, scalable backend for a task management and collaboration application, built with **Nest.js**. It supports user authentication, board/task management, comments, and real-time notifications. Designed as a practice project for Nest.js interviews, it demonstrates key concepts like modular architecture, dependency injection, TypeORM, JWT authentication, WebSockets, and API documentation with Swagger.

### Features
- **User Authentication**: Register, login, and role-based access (admin/user) using JWT.
- **Boards & Tasks**: CRUD operations for boards and tasks, with relational data (e.g., tasks belong to boards).
- **Comments**: Add/edit comments on tasks for collaboration.
- **Real-Time Updates**: WebSocket notifications for task assignments and updates.
- **API Documentation**: Swagger UI at `/api` for endpoint exploration.
- **Error Handling**: Custom exception filters for consistent responses.
- **Testing**: Unit and end-to-end tests with Jest and Supertest.

### Tech Stack
- **Framework**: Nest.js (TypeScript)
- **Database**: PostgreSQL with TypeORM
- **Authentication**: JWT via `@nestjs/jwt` and `@nestjs/passport`
- **Real-Time**: WebSockets with `@nestjs/websockets` and Socket.io
- **Validation**: `class-validator` and `class-transformer`
- **Documentation**: Swagger via `@nestjs/swagger`
- **Testing**: Jest, Supertest
- **Linting/Formatting**: ESLint, Prettier

## Setup Instructions

### Prerequisites
- **Node.js**: v24 or higher
- **PostgreSQL**: v17 or higher
- **npm**: v11 or higher
- **Docker & Docker Compose**: For running PostgreSQL in a container

### Quick Start with Docker (Recommended)
The easiest way to get started is using Docker Compose and Make:

1. **Start PostgreSQL and Development Server**:
   ```bash
   make dev
   ```
   This will start PostgreSQL in a container and then start the development server.

2. **Available Make Commands**:
   ```bash
   make help     # Show all available commands
   make dev      # Start PostgreSQL and development server
   make up       # Start PostgreSQL only
   make down     # Stop PostgreSQL
   make clean    # Stop PostgreSQL and remove volumes
   make logs     # Show PostgreSQL logs
   ```

### Manual Installation
1. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd collabotask-api
   ```

2. **Install Dependencies**:
   ```bash
   npm install
   ```

3. **Set Up Environment Variables**:
   Create a `.env` file in the root directory:
   ```env
   # Database Configuration (Docker)
   DATABASE_HOST=localhost
   DATABASE_PORT=5432
   DATABASE_USERNAME=postgres
   DATABASE_PASSWORD=postgres
   DATABASE_NAME=collabotask_dev
   JWT_SECRET=your-secret-key
   ```

4. **Set Up PostgreSQL**:
   **Option A: Using Docker (Recommended)**:
   - The database will be automatically created when using `make dev` or `make up`
   
   **Option B: Local PostgreSQL**:
   - Ensure PostgreSQL is running.
   - Create a database named `collabotask_dev`:
     ```sql
     CREATE DATABASE collabotask_dev;
     ```

5. **Run Migrations**:
   ```bash
   npm run typeorm:migration:run
   ```
   Note: `synchronize: true` is enabled in development for simplicity. Disable in production.

6. **Start the Application**:
   ```bash
   npm run start:dev
   ```
   - API runs at `http://localhost:3000`.
   - Swagger UI available at `http://localhost:3000/api`.

### Running Tests
- **Unit Tests**:
  ```bash
  npm run test
  ```
- **End-to-End Tests**:
  ```bash
  npm run test:e2e
  ```

## API Endpoints
Explore the full API documentation at `http://localhost:3000/api`. Key endpoints include:
- **Auth**:
  - `POST /auth/register`: Register a new user.
  - `POST /auth/login`: Obtain a JWT token.
- **Boards**:
  - `POST /boards`: Create a board (authenticated).
  - `GET /boards/:id`: Get a board with tasks.
- **Tasks**:
  - `POST /tasks`: Create a task (authenticated).
  - `GET /tasks/:boardId`: List tasks for a board.
- **Comments**:
  - `POST /comments`: Add a comment to a task (authenticated).
- **WebSockets**:
  - Connect to `ws://localhost:3000` for real-time notifications (e.g., `taskUpdated` event).

## Project Structure
```
collabotask-api/
├── src/
│   ├── auth/                 # Authentication module (JWT, roles)
│   ├── boards/               # Board management module
│   ├── tasks/                # Task management module
│   ├── comments/             # Comment management module
│   ├── common/               # Shared utilities (filters, interceptors)
│   ├── websockets/           # Real-time notifications
│   ├── config/               # Database configuration
│   ├── app.module.ts         # Root module
│   ├── main.ts               # Entry point
│   └── swagger.ts            # Swagger setup
├── test/                     # Unit and e2e tests
├── .env                      # Environment variables
└── README.md
```

## Usage
1. **Register/Login**: Use `/auth/register` and `/auth/login` to obtain a JWT token.
2. **Manage Boards/Tasks**: Create boards and tasks, assign tasks to users.
3. **Collaborate**: Add comments and receive real-time updates via WebSockets.
4. **Test**: Use Postman or Swagger to interact with the API.

## Future Improvements
- Add Redis for caching frequently accessed boards/tasks.
- Implement file uploads for task attachments.
- Split auth into a microservice using `@nestjs/microservices`.
- Add email notifications with Nodemailer.

## Contributing
This is a practice project for Nest.js interview preparation. Feel free to fork and extend with additional features like GraphQL or advanced testing.

## License
MIT License. Created for educational purposes.
