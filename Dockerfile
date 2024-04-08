FROM python:3.8.15-alpine

RUN apk --no-cache add curl sudo
RUN apk add --no-cache tzdata
ENV TZ=Europe/Madrid

RUN curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_17.9.1.1-1_amd64.apk \
    && sudo apk add --allow-untrusted msodbcsql17_17.9.1.1-1_amd64.apk \
    && apk add g++ unixodbc-dev \
    && rm msodbcsql17_17.9.1.1-1_amd64.apk
RUN apk add --no-cache mariadb-dev

COPY requirements.txt ./
RUN apk add libffi-dev
RUN pip install --upgrade pip
RUN pip install -r requirements.txt