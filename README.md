**Create a config/config.local.neon file and paste the code below:**

database:
    # host: db is correct for Docker Compose communication
    dsn: 'mysql:host=db;dbname=db_local' 
    user: 'local_user'                             
    password: 'local_password'                              
    options:
        lazy: yes
parameters:
    google:
        client_id: <client_id>
        client_secret: <client_secret>
    files:
        path: /var/www/html/temp/
tracy:
    showBar: true
    maxDepth: 15
session:
    autoStart: always
Go to https://console.cloud.google.com/ and create a project. Once the project created, go to clients page and create a client. Once the client created, copy the client_id and clien_secret and paste it to the config/config.local.neon.

**Make sure to setup authorized javascript origins and redirect urls**
