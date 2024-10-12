FROM python:3.9-slim

WORKDIR /app

COPY  requirements.txt .

RUN apt-get update && apt-get install -y \
    curl \
    gnupg2 \
    unixodbc \
    unixodbc-dev \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list \
    && apt-get update \
    && ACCEPT_EULA=Y apt-get install -y msodbcsql18 \
    && rm -rf /var/lib/apt/lists/*


RUN pip install --upgrade pip && \
    pip install -r requirements.txt

COPY . .

ENV DB_SERVER=database-1.c58k2g8o8de7.ap-south-1.rds.amazonaws.com
ENV DB_DATABASE=database-1
ENV DB_USERNAME=admin
ENV DB_PASSWORD=admin1234


CMD ["python", "app.py"]

EXPOSE 5000
