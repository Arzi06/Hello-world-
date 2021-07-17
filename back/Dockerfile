FROM python:3.6

WORKDIR /app

EXPOSE 3000

COPY requirements.txt /app

RUN pip install -r requirements.txt

COPY back.py /app

CMD python back.py
