# Использовать официальный образ родительского образа / слепка.
FROM python:3.9
# Скопировать все файлы с локальной машины внутрь файловой системы виртуального образа.
COPY . .
# Установка рабочей директории, откуда выполняются команды внутри контейнера.
WORKDIR /stocks_products
# Запустить команду внутри образа, установка зависимостей.
RUN pip install -r requirements.txt
ENV SECRET_KEY='the-best-secret-key'
ENV DEBUG='True'
ENV DJANGO_ALLOWED_HOSTS='localhost 127.0.0.1' 
# Добавить мета-информацию к образу для открытия порта к прослушиванию.
EXPOSE 8000
RUN python manage.py makemigrations
RUN python manage.py migrate
# Выполнить команду внутри контейнера
CMD python manage.py runserver 0.0.0.0:8000
