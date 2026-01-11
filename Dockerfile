FROM python:3.12-slim-bookworm

WORKDIR /app
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    git python3 python3-pip ffmpeg \
    && rm -rf /var/lib/apt/lists/*

COPY . .

# Fix ethon + upgrade pip first
RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install "ethon>=0.1.5" --no-cache-dir || true
RUN sed -i 's/ethon==1.3.6/ethon>=0.1.5/g' requirements.txt || true
RUN pip3 install --no-cache-dir -r requirements.txt

CMD ["python3", "main.py"]
