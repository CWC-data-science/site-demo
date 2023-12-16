FROM nikolaik/python-nodejs:python3.11-nodejs20-alpine


# Install prerequisites
RUN apk update && apk add --no-cache \
    ca-certificates \
    bash \
    curl \
    && rm -rf /var/cache/apk/* 


WORKDIR /app
RUN pip install --no-cache-dir --upgrade pip
# for sending files to other devices
COPY requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
RUN python -m pip install --no-cache-dir -e .

WORKDIR /app/www
RUN npm install
RUN npm run build

WORKDIR /app
# Expose the port and then launch the app.
EXPOSE 80
CMD ["/bin/bash", "prod"]
