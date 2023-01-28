# Склады и товары

```
docker build . --tag=crud_image
```

```
docker run -d -p 7000:8000 --name=crud_cont crud_image
```

```
curl localhost:7000
```