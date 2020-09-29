# Update VARIANT in devcontainer.json to pick a Dart version
ARG VARIANT=2
FROM google/dart:${VARIANT}

# [Option] Install zsh
ARG INSTALL_ZSH="false"
# [Option] Upgrade OS packages to their latest versions
ARG UPGRADE_PACKAGES="false"

# Install needed packages and setup non-root user. Use a separate RUN statement to add your own dependencies.
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
COPY library-scripts/*.sh /tmp/library-scripts/
RUN apt-get update \
  && /bin/bash /tmp/library-scripts/common-debian.sh "${INSTALL_ZSH}" "${USERNAME}" "${USER_UID}" "${USER_GID}" "${UPGRADE_PACKAGES}" \
  && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts

# Add bin location to path
ENV PUB_CACHE="/usr/local/share/pub-cache"
ENV PATH="${PATH}:${PUB_CACHE}/bin"
RUN mkdir -p ${PUB_CACHE} \
  && chown ${USERNAME}:root ${PUB_CACHE} \
  && echo "if [ \"\$(stat -c '%U' ${PUB_CACHE})\" != \"${USERNAME}\" ]; then sudo chown -R ${USER_UID}:root ${PUB_CACHE}; fi" \
  | tee -a /root/.bashrc /root/.zshrc /home/${USERNAME}/.bashrc >> /home/${USERNAME}/.zshrc

# Install Flutter prerequisites packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install --no-install-recommends curl git unzip xz-utils zip libglu1-mesa wget openjdk-11-jdk \
  && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Prepare Android directories and system variables
USER ${USERNAME}
WORKDIR /home/${USERNAME}
RUN mkdir -p Android/sdk .android && touch .android/repositories.cfg

# Set up Android SDK
RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip \
  && unzip sdk-tools.zip && rm sdk-tools.zip \
  && mv tools Android/sdk/tools && cd Android/sdk/tools \
  && mkdir jaxb_lib \
  && wget https://repo1.maven.org/maven2/javax/xml/bind/jaxb-api/2.3.1/jaxb-api-2.3.1.jar -O jaxb_lib/jaxb-api.jar \
  && wget https://repo1.maven.org/maven2/org/glassfish/jaxb/jaxb-core/2.3.0.1/jaxb-core-2.3.0.1.jar -O jaxb_lib/jaxb-core.jar \
  && wget https://repo1.maven.org/maven2/com/sun/xml/bind/jaxb-impl/2.3.0.1/jaxb-impl-2.3.0.1.jar -O jaxb_lib/jaxb-impl.jar \
  && wget https://repo1.maven.org/maven2/org/glassfish/jaxb/jaxb-jxc/2.3.3/jaxb-jxc-2.3.3.jar -O jaxb_lib/jaxb-jxc.jar \
  && wget https://repo1.maven.org/maven2/org/glassfish/jaxb/jaxb-xjc/2.3.3/jaxb-xjc-2.3.3.jar -O jaxb_lib/jaxb-xjc.jar \
  && wget https://repo1.maven.org/maven2/javax/activation/activation/1.1.1/activation-1.1.1.jar -O jaxb_lib/activation.jar \
  && wget https://repo1.maven.org/maven2/com/sun/istack/istack-commons-runtime/3.0.11/istack-commons-runtime-3.0.11.jar -O jaxb_lib/istack-commons-runtime.jar \
  && sed -ie 's%^CLASSPATH=.*%\0:$APP_HOME/jaxb_lib/*%' bin/sdkmanager bin/avdmanager \
  && yes | ./bin/sdkmanager --licenses \
  && ./bin/sdkmanager "build-tools;29.0.2" "patcher;v4" "platform-tools" "platforms;android-29" "sources;android-29"

# Download Flutter SDK
RUN git clone https://github.com/flutter/flutter.git

# Prepare system variables
ENV ANDROID_SDK_ROOT /home/${USERNAME}/Android/sdk
ENV PATH "$PATH:/home/${USERNAME}/Android/sdk/platform-tools"
ENV PATH "$PATH:/home/${USERNAME}/flutter/bin"

# Init Flutter
RUN flutter doctor
