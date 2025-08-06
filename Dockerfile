FROM pierrezemb/gostatic

COPY ./build/ /srv/http/

CMD ["-port","3000","-https-promote", "-enable-logging"]
