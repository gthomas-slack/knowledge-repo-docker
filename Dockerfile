FROM python:3.5

# Install Python Stuff
RUN pip install --upgrade pip
#RUN pip install knowledge-repo[all]
RUN pip install --upgrade mysqlclient flask
RUN pip install SQLAlchemy==1.1.18


RUN git clone https://github.com/gthomas-slack/knowledge-repo.git
RUN cd knowledge-repo && python setup.py install

RUN pip install --upgrade mysqlclient

# Copy stuff into app
COPY . /app
WORKDIR /app

# Run it!
CMD bash /app/start.sh