#!/bin/bash
echo "This is entrypoint.sh" 
echo "Create new index.html" 
echo "<head></head><body><body><h1 align=center>Hello $NAME</h1></body>" > /usr/share/nginx/html/index.html
/usr/sbin/nginx -g "daemon off;" 

