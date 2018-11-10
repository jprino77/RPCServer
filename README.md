# RPCServer
Servidor Para Tp2 RPC Sistemas Distribuidos 2018


# Como Se generaron Los servicios con Apache trihft

1) Se ejecuto desde linea de comando thrift-0.11.0.exe (Esta adentro de la carpeta resouces del proyecto) de la siguiente forma
thrift-0.11.0.exe --gen java ClubLosAmigos.trihft dentro de este ultimo se encuentran las estructuras de datos y los servicios que se van a utilizar para la comunicacion.

2) Se Realizo la implementacion de los servicios

# Pasos para montar en entorno local

- Convertirlo a proyecto MAVEN:
    Eclipse: click derecho sobre el proyecto -> Configure -> convet to Maven project ..
    
# Como compilar y ejecutar

- Desde cmd o terminal entrar a la carpeta del proyecto y ejecutar mvn clean install,  el jar se creara en la carpeta target
- Para ejecutarlo correr java -jar RPCServer-jar-with-dependencies.jar (en caso de no estar dentro de la misma carpeta ejecutar java -jar path/RPCServer-jar-with-dependencies.jar)
