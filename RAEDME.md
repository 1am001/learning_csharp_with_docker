# learning_csharp_with_docker
### To build the docker image

```bash
docker build --build-arg PROGRAM_FILE=Helloworld.cs -t csharp-program-image .
```

### To run the program in container using that image and delete the container after it finished.

```bash
docker run --rm csharp-program-image
```
