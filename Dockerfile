# Gunakan image dasar Python
FROM python:3.10-slim


# Atur direktori kerja di dalam container
WORKDIR /app

# Salin requirements.txt dan install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Salin seluruh kode proyek ke dalam container
COPY . /app/

# Jalankan perintah untuk mengumpulkan static files
RUN python manage.py collectstatic --noinput

# Expose port yang akan digunakan oleh aplikasi
EXPOSE 8000

# Jalankan server Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
