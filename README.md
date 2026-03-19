<div align="center">
    <img height="150" src="https://files.nette.org/git/www/nette-logo-blue.png"  />
    <img height="150" src="https://blog.nashtechglobal.com/wp-content/uploads/2024/09/Docker.logo2_.png" />
</div>

###

<div align="center">
  <a href="https://www.linkedin.com/in/mark-dhem-mansueto/" target="_blank">
    <img src="https://img.shields.io/static/v1?message=LinkedIn&logo=linkedin&label=&color=0077B5&logoColor=white&labelColor=&style=for-the-badge" height="25" alt="linkedin logo"  />
  </a>
  <p><a href="https://www.linkedin.com/in/mark-dhem-mansueto/" target="_blank"> Created by Mark Dhem Mansueto </a></p>
</div>

###

<h1 align="center">Hi there 👋<br>This is a docker setup for existing nette framework projects for your local machines (Windows, Mac, Linux)</h1>

###

<p align="left">Create a config/config.local.neon file and paste the code below:</p>

###

<pre align="left">database:<br>    dsn: 'mysql:host=db;dbname=db_local' <br>    user: 'local_user'                             <br>    password: 'local_password'                              <br>    options:<br>        lazy: yes<br>parameters:<br>    google:<br>        client_id: <client_id><br>        client_secret: <client_secret><br>    files:<br>        path: /var/www/html/temp/<br>tracy:<br>    showBar: true<br>    maxDepth: 15<br>session:<br>    autoStart: always</pre>

###

<p align="left">Go to https://console.cloud.google.com/ and create a project. Once the project created, go to clients page and create a client. Once the client created, copy the client_id and clien_secret and paste it to the config/config.local.neon.<br><br><strong>Make sure to setup authorized javascript origins and redirect urls</strong></p>

###
<p align="left">
Once done setting up the configuration, time to run the following command:
<ol>
    <li>docker compose up -d </li>
    <li>docker exec -i nette-app composer update </li>
    <li>docker exec -i nette-db mysql -u local_user -plocal_pass db_local < db.sql </li>
</ol>
</p>

###

<h3>Once done, setup your hosts file. </h3>
<p>
<strong>For windows:</strong>
Open your notepad and run it as administrator, open file C:\Windows\System32\drivers\etc\hosts <br>
Add this at the bottom of the file: <br>
127.0.0.1 local.nette.dev

<strong>For Mac and Linux:</strong> <br>
Run 'sudo nano /etc/hosts' and add  this at the bottom of the file <br>
127.0.0.1 local.nette.dev 
</p>
