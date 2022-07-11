FROM ubuntu:22.04

RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 871920D1991BC93C && apt-get update \
  && apt-get install -y --no-install-recommends \
  python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /code

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . /code/
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]