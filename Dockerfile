# Use Python 3.7 — this project's dependencies (flask-restplus 0.13.0)
# only work on Python 3.7. Newer Python versions break the install.
FROM python:3.7-slim

# Set the working directory inside the container
WORKDIR /app

# Copy requirements first so Docker can cache the pip install layer
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the project files (app.py, db.py, ma.py, resources/, data.db, ...)
COPY . .

# The Flask app listens on port 5000
EXPOSE 5000

# Start the application
CMD ["python", "app.py"]
