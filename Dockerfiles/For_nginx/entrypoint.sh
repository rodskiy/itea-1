#!/bin/bash
<<<<<<< HEAD
echo "<head></head><body><h1 align=center>HELLO $NAME!</h1></body>" > index.htm
=======
echo "This is entrypoint.sh" 
echo "Create new index.html" 
echo "<head></head><body><body><h1 align=center>Hello $NAME</h1></body>" > /usr/share/nginx/html/index.html
/usr/sbin/nginx -g "daemon off;" 

>>>>>>> c3982d4d0751427b3d60e6e580c554b14155cdb8
