FROM python:3.12-slim

WORKDIR /app

COPY pyproject.toml ./

RUN pip install uv

COPY . .

RUN uv sync --no-dev

CMD ["uv", "run", "python", "-m", "app.main"]