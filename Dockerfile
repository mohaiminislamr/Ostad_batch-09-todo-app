FROM python:3.12-slim

# Python আউটপুট সাথে সাথে লগে দেখানোর জন্য
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# ডিপেন্ডেন্সি ইনস্টল
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# পুরো প্রজেক্ট কপি
COPY . .

RUN mkdir -p /app/data

EXPOSE 8000

# কন্টেইনার চালু হলে প্রথমে migrate চলবে, তারপর সার্ভার রান হবে
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]