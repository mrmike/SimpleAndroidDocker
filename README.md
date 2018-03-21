### simple-android-docker

Docker image for building Android applications.

### What's inside?
Image contains basic tools required to build Android applications.
```
* Gradle 4.6
* SDK tools (sdkmanager included)
* android-27
* platform-tools
* build-tools 27.0.3
* Google m2 repository
```
### Building image
To build image from `Dockerfile` make sure that Docker is installed and launched and then call
```
docker build -t simple-android-docker .
```
Instead of `simple-android-docker` you can use whatever name you like.

### Docker hub
Image is available on Docker hub: https://hub.docker.com/r/michalmoczulski/simple-android-docker/
To pull an image call
```
docker pull michalmoczulski/simple-android-docker
```

### Building Android app using this image
To build an Android app call from the app folder
```
docker run --rm  \
                -v $(pwd):/workspace \
                -w /workspace \
                simple-android-docker gradle clean build
```

### Sample project
There's a sample Android app project showing how this image can be used for Android continous integration. Take a look at https://github.com/mrmike/android-ci-sample

