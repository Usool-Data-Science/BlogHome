FROM python:3.10-slim

ENV FLASK_APP bloghome.py
ENV FLASK_ENV production

COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY api api
COPY migrations migrations
COPY alembic.ini alembic.ini
COPY bloghome.py config.py boot.sh ./

EXPOSE 5000
CMD ./boot.sh
