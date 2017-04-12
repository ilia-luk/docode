FROM mongo:3.4.2
RUN apt-get update && apt-get install -y netcat-traditional netcat-openbsd

COPY ./.docker/mongo_machine /mongo_machine

RUN touch /.runonce

RUN chmod +rx /mongo_machine/*.sh

EXPOSE 27017

CMD ["/mongo_machine/start.sh"]
