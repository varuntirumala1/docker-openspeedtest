FROM varuntirumala1/alpine-nginx:latest

COPY /files/openspeedtest.conf /config/nginx/site-confs/default
COPY /files/www/* /usr/share/nginx/html/
COPY /etc/cont-init.d/ /etc/cont-init.d/

RUN rm -rf /etc/nginx/conf.d/default.conf \
    && wget http://ipv4.download.thinkbroadband.com/512MB.zip -O /usr/share/nginx/html/downloading \
	&& wget https://openspeedtest.com/load/upload -O /usr/share/nginx/html/upload \
    && rm -rf /usr/share/nginx/html/*.html \
    && chmod 755 /usr/share/nginx/html/upload \
    && chmod 755 /usr/share/nginx/html/downloading \
	&& chmod +x /etc/cont-init.d/80-custom

# Listen to required port(s)
EXPOSE 80
