FROM python:3.9-slim
WORKDIR /app

# small production practice: install pip, copy requirements, install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# copy app (will be set by build script)
COPY app.py .

EXPOSE 5000
CMD ["python", "app.py"]
