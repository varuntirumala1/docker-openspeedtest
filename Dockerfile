FROM varuntirumala1/alpine-nginx:latest

COPY /files/openspeedtest.conf /etc/nginx/conf.d/openspeedtest.conf
COPY /files/www/* /usr/share/nginx/html/
COPY /etc/cont-init.d/ /etc/cont-init.d/

RUN rm -rf /etc/nginx/conf.d/default.conf \
    && wget https://openspeedtest.com/downloading -O /usr/share/nginx/html/downloading \
	&& wget https://openspeedtest.com/load/upload -O /usr/share/nginx/html/upload \
    && rm -rf /usr/share/nginx/html/*.html \
    && chmod 755 /usr/share/nginx/html/upload \
    && chmod 755 /usr/share/nginx/html/downloading \
	&& chmod +x /etc/cont-init.d/80-custom

# Listen to required port(s)
EXPOSE 8080
