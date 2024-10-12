FROM python:3.9-slim

WORKDIR /app

COPY  requirements.txt .

RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    unixodbc \
    unixodbc-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip && \
    pip install -r requirements.txt

COPY . .

ENV DB_SERVER=localhost
ENV DB_DATABASE=database-1
ENV DB_USERNAME={{ secrets.DB_USERNAME }}
ENV DB_PASSWORD={{ secrets.DB_PASSWORD }}


CMD ["python", "app.py"]

EXPOSE 5000
