FROM python:3.11-slim
LABEL authors="vasanthm"

RUN addgroup --system --gid 1000 appgroup && \
    adduser --system --uid 1000 --ingroup appgroup appuser

WORKDIR /app
COPY main.py .

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

RUN chown -R appuser:appgroup /app
USER 1000:1000


CMD ["pytest", "tests.py,", "--doctest-modules", "--junitxml=junit/test-results.xml", "--cov=com", "--cov-report=xml", "--cov-report=html"]