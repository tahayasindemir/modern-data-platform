FROM python:3.14-slim

WORKDIR /app

RUN pip install --no-cache-dir \
    dbt-core==1.12.3 \
    dbt-snowflake==1.12.0

COPY . /app

ENTRYPOINT ["dbt"]