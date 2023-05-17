## REQUIREMENT
- Docker version 23.0.5

## HOW TO RUN
1. Install mysql in local:

2. Config mysql credentials in cdc.yaml

3. Run docker compose command: 
  ```powershell
    docker-compose up
  ```
To rerun specific service
  ```powershell
    docker-compose up --build --force-recreate <service_name> 
  ```
To go to docker cmd
  ```powershell
    docker ps
    docker exec -it <container_id> /bin/sh
  ```

4. Go to docker cmd and run: 
  ```powershell
    bin/pulsar-admin source localrun  --sourceConfigFile cdc.yaml
  ```
5. View topics:
  ```powershell
    bin/pulsar-admin topics list public/default
  ```

6. View message consume:
  ```powershell
    bin/pulsar-client consume -s "sub-tank" public/default/dbserver1.inventory.tank -n 0
  ```

## MYSQL
1. Go to 'mysql' docker cmd (pwd: password):
  ```powershell
    mysql -u user -p inventory;
    use inventory;
  ```
2. MySQL commands:
  ```powershell
    insert into inventory values (1)
  ```

## PULSAR MANAGER
- GET XSRF-TOKEN: 
  ```powershell
    curl --location --request GET 'http://localhost:7750/pulsar-manager/csrf-token' \
  ```
- Create manage user
  ```powershell
    curl --location --request PUT 'http://localhost:7750/pulsar-manager/users/superuser' \
    --header 'X-XSRF-TOKEN: {REPLACE_THIS_WITH_ABOVE_TOKEN}'\
    --header 'Cookie: XSRF-TOKEN={REPLACE_THIS_WITH_ABOVE_TOKEN};' \
    --header 'Content-Type: application/json' \
    --data-raw '{"name": "admin", "password": "apachepulsar", "description": "test", "email": "username@test.org"}'
  ```
- Go to management URL: http://localhost:9527/#/environments
  ```powershell
    ServiceURL: http://pulsar:8080
    Bookie URL: http://pulsar:6650
  ```

## ISSUES
1. Bookie handle is not available
-> stop, remove all pulsar manager + pulsar container
-> remove folder ./tools (which is created automatically when running)


