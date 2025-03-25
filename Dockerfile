# Use the Python 3.11 slim base image
FROM python:3.11-slim

# Install system dependencies needed for building C extensions (e.g., for aiohttp)
RUN apt-get update && apt-get install -y \
    build-essential \
    python3-dev \
    libssl-dev \
    libffi-dev \
  && rm -rf /var/lib/apt/lists/*

# Upgrade pip, setuptools, and wheel
RUN pip install --upgrade pip setuptools wheel

# Set the working directory in the container
WORKDIR /app

# Copy your requirements file and install Python dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the rest of your application code into the container
COPY . .

# Expose a port if your app listens on one (optional)
# EXPOSE 8000

# Define the command to run your application
CMD ["python3", "main.py"]
