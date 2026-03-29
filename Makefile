include .env
export

export PROJECT_ROOT=${shell pwd}

env-up:
	docker compose up -d todoapp-postgres

env-down:
	docker compose down todoapp-postgres

env-cleanup:
	@read -p "Очистить все volume файлы окружения? Опасность утери данных! [Y/N]: " ans; \
	if [ "$$ans" = "Y" ]; then \
		docker compose down todoapp-postgres && \
		sudo rm -rf out/pgdata && \
		echo "Файлы окружения очищены"; \
	else \
		echo "Очистка окружения отменена"; \
	fi