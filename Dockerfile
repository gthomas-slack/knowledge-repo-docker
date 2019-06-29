FROM python:3.5

# Install Python Stuff
RUN pip install --upgrade pip
RUN pip install knowledge-repo[all]
RUN pip install --upgrade mysqlclient

# Copy stuff into app
COPY . /app
WORKDIR /app

# Run it!
CMD bash /app/start.sh