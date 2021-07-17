FROM python:3.6

WORKDIR /app

COPY . /app

RUN apt-get -y update && apt-get -y install nginx
RUN pip install -r requirements.txt

EXPOSE 3001

CMD python front.py
