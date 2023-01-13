FROM python:3.9

WORKDIR /edia
COPY . .

RUN mkdir /edia/logs
RUN mkdir /edia/config
RUN mkdir /edia/data_custom

RUN python -m pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8080

CMD ["python", "app.py"]