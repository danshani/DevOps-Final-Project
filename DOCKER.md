# Question 1 – Running the Flask App in Docker

This document covers **Question 1 / Part A**: containerizing the Flask
(Flask-RESTPlus) sample application and running it in Docker.

## What the app is

A small Flask + Flask-RESTPlus REST API.

- **Entry point:** `app.py`
- **Server port:** `5000`
- **Host:** the app already runs on `0.0.0.0`, so it is reachable from outside
  the container (required for Docker).
- **Database:** SQLite (`data.db`), created automatically on first request.

## The Dockerfile

The image is based on **Python 3.7**, because the project's pinned
dependencies (e.g. `flask-restplus==0.13.0`) only work on Python 3.7.

```dockerfile
FROM python:3.7-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 5000
CMD ["python", "app.py"]
```

## Build and run

```bash
# 1. Build the image
docker build -t flask-app .

# 2. Run the container (maps host port 5000 -> container port 5000)
docker run -d -p 5000:5000 --name flask-app flask-app

# 3. Check it is running
docker ps
```

## Access the app

Open in a browser:

```
http://localhost:5000/api/doc
```

You should see the Swagger UI page titled **"Sample Flask-RestPlus Application"**.

## Stop and remove

```bash
docker stop flask-app
docker rm flask-app
```

## Notes

- The `pip install` step needs internet access to `pypi.org`. On a restricted
  (corporate/work) network the download may time out — use a normal network
  or a phone hotspot to build.
