FROM python:3.10-slim

ENV APP_HOME /app
WORKDIR ${APP_HOME}

COPY requirements.txt ./requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

COPY . ./

EXPOSE 80

# CMD python pnl_etoro.py

CMD gunicorn -b 0.0.0.0:80 pnl_etoro:server