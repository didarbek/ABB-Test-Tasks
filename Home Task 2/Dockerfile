# Specifying python image version
FROM python:3.6-slim-buster

# Copying 'requirements.txt' file
COPY requirements.txt

# Running command to install all the dependencies
RUN pip install -r requirements.txt

# Copying local data to docker container
COPY . .

# Running command to start flask application
CMD ["flask", "run", "--host=0.0.0.0", "--port=80"]