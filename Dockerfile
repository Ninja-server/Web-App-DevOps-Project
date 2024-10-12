FROM python:3.9-slim

WORKDIR /app

COPY  requirements.txt .

RUN apt-get update && apt-get install -y \
    unixodbc \
    unixodbc-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip && \
    pip install -r requirements.txt

COPY . .

CMD ["python", "app.py"]

EXPOSE 5000
