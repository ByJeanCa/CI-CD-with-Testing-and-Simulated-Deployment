FROM python:3.10

WORKDIR /api2

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    netcat-openbsd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

COPY . . 

RUN chmod +x "wait-for-db.sh"

CMD [ "./wait-for-db.sh" ]
