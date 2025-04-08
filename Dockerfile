# Use an official Python runtime as a parent image
FROM python:3.9-slim-buster

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the working directory
COPY requirements.txt .

# Install the application dependencies
RUN pip install -r requirements.txt

# Copy the application code to the working directory
COPY . .

# Expose the port that the Flask application runs on
EXPOSE 5000

# Define the command to run the Flask application
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]