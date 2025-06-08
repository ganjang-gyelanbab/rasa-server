FROM python:3.8

WORKDIR /app

COPY . /app

RUN pip install --upgrade pip
RUN pip install rasa==3.6.6
RUN pip install fastapi uvicorn requests

EXPOSE 5005

CMD ["rasa", "run", "--enable-api", "--port", "5005", "--model", "models"]
