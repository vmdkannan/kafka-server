# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Install required system packages
RUN apt-get update && apt-get install -y netcat-openbsd && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

# Set working directory 
WORKDIR /home/app

# Copy requirements.txt into the working directory
COPY requirements.txt .

# Copy the rest of the application code into the working directory
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt    

# Set default command to run the Python application
CMD ["python", "app.py"]