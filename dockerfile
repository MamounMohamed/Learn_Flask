FROM python:3.9-alpine

# Create app directory
WORKDIR /app
COPY app.py ./
COPY requirements.txt ./
RUN pip install -r requirements.txt


WORKDIR /app/static/css 
COPY static/css/main.css ./css

WORKDIR /app/templates 

COPY /templates/base.html ./ 
COPY /templates/index.html ./
COPY /templates/update.html ./



EXPOSE 5000
WORKDIR /app

CMD [ "flask", "--app","app.py","run","--host","0.0.0.0","--port","5000"]
