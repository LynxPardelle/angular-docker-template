# Global setup
# export COMPOSE_BAKE=true

# Variables
COMPOSE=docker-compose
PROFILE_ARG=--profile

# Commands
create:
	if [ ! -d "./src" ]; then \
		UID=$$(id -u) GID=$$(id -g) COMPOSE_BAKE=true $(COMPOSE) $(PROFILE_ARG) create up --build; \
		echo "✅ Proyecto creado correctamente."; \
	else \
		echo "⚠️ Proyecto ya existe. Borra la carpeta src/ para recrearlo."; \
	fi

dev:
	COMPOSE_BAKE=true $(COMPOSE) $(PROFILE_ARG) dev up --build

prod:
	COMPOSE_BAKE=true $(COMPOSE) $(PROFILE_ARG) build up --build

prod-no-ssr:
	COMPOSE_BAKE=true $(COMPOSE) $(PROFILE_ARG) build-no-ssr up --build

stop:
	$(COMPOSE) down

clean:
	$(COMPOSE) down --volumes --remove-orphans
	rm -rf node_modules package-lock.json

logs:
	$(COMPOSE) logs -f

rebuild:
	$(COMPOSE) down --volumes --remove-orphans
	COMPOSE_BAKE=true $(COMPOSE) up --build

install:
	docker compose --profile dev exec angular-app-dev npm install $(pkg)

install-dev:
	docker compose --profile dev exec angular-app-dev npm install --save-dev $(pkg)