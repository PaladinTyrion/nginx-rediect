docker run -d --net=host -p 9991:9991 -p 81:81 --name=nginx -v /data0/logs/nginx:/var/log/nginx paladintyrion/nginx-kibana
