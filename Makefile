.PHONY: help dev up down clean logs

# Default target
help:
	@echo "Available commands:"
	@echo "  dev     - Start PostgreSQL and development server"
	@echo "  up      - Start PostgreSQL only"
	@echo "  down    - Stop PostgreSQL"
	@echo "  clean   - Stop PostgreSQL and remove volumes"
	@echo "  logs    - Show PostgreSQL logs"

# Start PostgreSQL and development server
dev: up
	@echo "Starting development server..."
	@npm run start:dev

# Start PostgreSQL
up:
	@echo "Starting PostgreSQL..."
	@docker-compose up -d postgres
	@echo "Waiting for PostgreSQL to be ready..."
	@until docker-compose exec -T postgres pg_isready -U postgres; do sleep 1; done
	@echo "PostgreSQL is ready!"

# Stop PostgreSQL
down:
	@echo "Stopping PostgreSQL..."
	@docker-compose down

# Stop PostgreSQL and remove volumes
clean:
	@echo "Stopping PostgreSQL and removing volumes..."
	@docker-compose down -v

# Show PostgreSQL logs
logs:
	@docker-compose logs -f postgres
