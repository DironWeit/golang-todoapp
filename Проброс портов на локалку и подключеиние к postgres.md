Проброс портов 
# В файле docker-compose.yaml

```yaml
port-forwarder:
  image: alpine/socat:1.8.0.3
  container_name: todoapp-postgres-port-forwarder
  command: tcp-listen:5432,fork,reuseaddr tcp-connect:todoapp-postgres:5432
  ports:
    - "127.0.0.1:5432:5432"
```

Где:
```port-forwarder:``` - новый компосе
```command: tcp-listen:5432,fork,reuseaddr tcp-connect:todoapp-postgres:5432``` - команда которую просто запомнить
```- "127.0.0.1:5432:5432"``` - проброс порта, где мы говорим, что мы локалхост:5432 и в него передаем порт 5432 из докера компосе

# В файле Makefile
```Makefile
env-port-forwarder:
	@docker compose up -d port-forwarder
env-port-close:
	@docker compose down port-forwarder
```

две команды для запуска и остановки сервиса проброса портов

>>Но я поменял, и у меня получается на порте 5433 так как у меня 5432 ЗАНЯТ! :(


