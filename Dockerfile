FROM python:3.12-slim-bookworm

WORKDIR /app

ENV DEBIAN_FRONTEND=noninteractive

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    git \
    python3 \
    python3-pip \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

COPY . .

RUN pip3 install --no-cache-dir -r requirements.txt

CMD ["python3", "main.py"]  # Adjust if entrypoint is bot.py
