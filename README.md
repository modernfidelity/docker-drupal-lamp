Docker Drupal LAMP 
================

Base docker image to run PHP applications i.e. Drupal on Apache (also includes GO lang)


Building the base image
-----------------------

To create the base image `mofi/drupal-lamp`, execute the following command on the docker-drupal-lamp folder:

    docker build -t mofi/drupal-lamp .


Running your Apache+PHP docker image
------------------------------------

Start your image binding the external ports 80 in all interfaces to your container:

    docker run -d -p 8000:80 mofi/drupal-lamp

Test your deployment: (Mac OS X)


You will need to get the IP on the VM running via Boot2docker. 

    boot2docker ip

    
    curl IP:8000
    

This will show Ubuntu Apache screen.


Loading your custom PHP application
-----------------------------------

This image can be used as a base image for your PHP application. Create a new `Dockerfile` in your 
PHP application folder with the following contents:

    FROM mofi/drupal-lamp

After that, build the new `Dockerfile`:

    docker build -t username/my-php-app .

And test it:

    docker run -d -p 80:80 username/my-php-app

Test your deployment:

    curl http://localhost/




One liner to stop / remove all of Docker containers:

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)


