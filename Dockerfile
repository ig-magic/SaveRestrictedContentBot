FROM python:3.9-slim-bullseye

# Create working directory
RUN mkdir /app && chmod 777 /app
WORKDIR /app

# Prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update & install system dependencies
RUN apt -qq update && apt -qq install -y git ffmpeg && rm -rf /var/lib/apt/lists/*

# Copy source code
COPY . .

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Default command
CMD ["bash", "bash.sh"]
