# Use official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements
COPY ../../django_app/requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy Django app
COPY ../../django_app/ .

# Expose port
EXPOSE 8000

# Start script
CMD ["bash", "docker/gunicorn_start.sh"]
