version: '3.8'
services:
  backend:
    build: ./docker/backend
    ports:
      - "8000:8000"
    env_file: ../backend/.env
    depends_on:
      - db
  db:
    image: postgres:15
    environment:
      POSTGRES_USER: rsis
      POSTGRES_PASSWORD: rsis123
      POSTGRES_DB: rsis_db
    ports:
      - "5432:5432"
  crow:
    build: ./docker/crow
    ports:
      - "9000:9000"
