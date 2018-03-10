from anapsix/alpine-java:8_jdk

LABEL maintainer "Michał Moczulski <moczul@gmail.com>"

# Make wget https working
RUN apk add --update openssl

# Install Gradle
RUN wget https://services.gradle.org/distributions/gradle-4.6-bin.zip
RUN unzip gradle-4.6-bin.zip -d /opt/
RUN mv opt/gradle-4.6/ opt/gradle

ENV GRADLE /opt/gradle/bin
ENV PATH ${PATH}:${GRADLE}

ADD gradle.properties /.gradle/
ENV GRADLE_USER_HOME /.gradle/

# Clean up gradle zip file
RUN rm gradle-4.6-bin.zip

# Get SDK Platform Tools
RUN mkdir /opt/android-sdk
ENV ANDROID_HOME /opt/android-sdk

RUN wget https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip
RUN unzip sdk-tools-linux-3859397.zip -d ${ANDROID_HOME}

ENV PATH ${PATH}:${ANDROID_HOME}/tools/bin

# Clean up sdk tools
RUN rm sdk-tools-linux-3859397.zip

# Install Android sdk-components 
RUN mkdir ~/.android
# Workaround for "Warning: File /root/android/repositories.cfg could not be loaded"
RUN touch ~/.android/repositories.cfg

RUN yes | sdkmanager --licenses
RUN sdkmanager "platforms;android-27" "tools" "platform-tools" "extras;google;m2repository" "build-tools;27.0.3" --verbose

