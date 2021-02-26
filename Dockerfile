FROM varuntirumala1/alpine-nginx:latest

COPY /files/openspeedtest.conf /etc/nginx/conf.d/openspeedtest.conf
COPY /files/www/* /usr/share/nginx/html/

USER root

RUN rm -rf /etc/nginx/conf.d/default.conf \
    && wget https://openspeedtest.com/downloading -O /usr/share/nginx/html/downloading \
	&& wget https://openspeedtest.com/load/upload -O /usr/share/nginx/html/upload \
    && rm -rf /usr/share/nginx/html/*.html \
	&& chown -R nginx /usr/share/nginx/html/ \
    && chmod 755 /usr/share/nginx/html/downloading \
    && chmod 755 /usr/share/nginx/html/upload \
	&& chown nginx /etc/nginx/conf.d/openspeedtest.conf \
	&& chmod 400 /etc/nginx/conf.d/openspeedtest.conf

USER nginx

# Listen to required port(s)
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
