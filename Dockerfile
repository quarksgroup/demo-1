FROM pierrezemb/gostatic

COPY public/ /srv/http/

CMD ["-port","3000","-https-promote", "-enable-logging"]
