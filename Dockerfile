# Use a Python image with GUI support libraries
FROM python:3.11-slim

# Install system dependencies for ADB, OCR (Tesseract), and GUI rendering
RUN apt-get update && apt-get install -y \
    adb \
    tesseract-ocr \
    libtk8.6 \
    libx11-6 \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy requirements and install Python libraries
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

# Set environment variable for Python to unbuffer logs (better for Docker console)
ENV PYTHONUNBUFFERED=1

# Command to run the app
CMD ["python", "main.py"]