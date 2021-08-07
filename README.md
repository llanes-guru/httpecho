

### Packaging

```
docker build --network=host -t llanesguru/httpecho .
```

### Running

Default response

```
docker run --rm -it -p 8080:8080 llanesguru/httpecho:latest
```

Custom response
```
docker run --rm -it -p 8080:8080 -e RESPONSE_TEXT="This is the response text" llanesguru/httpecho:latest
```# httpecho
