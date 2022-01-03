FROM python:3.7.12

# create app directory
WORKDIR /app

# install application dependencies
COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

# bundle app source
COPY . .

EXPOSE 5000
CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]
