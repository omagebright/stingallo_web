FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN stingallo_web create-db
RUN stingallo_web populate-db
RUN stingallo_web add-user -u admin -p admin
EXPOSE 5000
CMD ["stingallo_web", "run"]
