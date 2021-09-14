From ubuntu:20.04

WORKDIR /app/

RUN apt update 
RUN apt upgrade
RUN apt install vim -y
RUN apt install build-essential -y

COPY . . 

# creando el directorio de mis scripts personales
RUN mkdir /usr/bin/personal 

# Install Betty
RUN bash /app/Betty/install.sh

# copiar el script para compilar archivos en c
# Copiar el ejecutable Betty en mis binarios
RUN cp /app/compilar /usr/bin/personal/
RUN cp /app/Betty/betty /usr/bin/personal/

# volvemos el archivo ejecutable
RUN chmod +x /usr/bin/personal/compilar
RUN chmod +x /usr/bin/personal/betty

# creamos la variable de entorno
RUN echo "export PATH=$PATH:/usr/bin/personal/" >> ~/.bashrc

# agregamos la sintaxis de betty holberton para codificacion en C.
RUN cp /app/betty-vim ~/.vimrc

