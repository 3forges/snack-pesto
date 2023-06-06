#!/bin/bash
export OPS_HOME=$(mktemp -d -t XXXXXXXX_INSTALL_ANDROID_SDK)
cd ${OPS_HOME}

export ANDROID_SDK_VERSION="9477386_latest"
export ANDROID_SDK_OS="linux"

export DWNLD_LINK_ASDK=https://dl.google.com/android/repository/commandlinetools-linux-${ANDROID_SDK_VERSION}.zip

# ---- ---- ---- ---- ---- ---- #
# ---- SYS Dependencies ------- #
# sudo apt-get install -y openjdk-8-jdk
sudo apt-get install -y openjdk-17-jdk unzip
java -version
# bob@laptop:~/try_snack/tentative_1/runtime$ java -version
# openjdk version "17.0.6" 2023-01-17
# OpenJDK Runtime Environment (build 17.0.6+10-Debian-1deb11u1)
# OpenJDK 64-Bit Server VM (build 17.0.6+10-Debian-1deb11u1, mixed mode, sharing)





curl -LO ${DWNLD_LINK_ASDK}

mkdir -p ./dezippemoi/

unzip ./commandlinetools-linux-${ANDROID_SDK_VERSION}.zip -d ./dezippemoi/

ls -alh ./dezippemoi/cmdline-tools/bin/

export ANDROID_HOME=~/.android.pesto
mkdir -p ${ANDROID_HOME}/cmdline-tools/latest/
cp -fR ./dezippemoi/cmdline-tools/* ${ANDROID_HOME}/cmdline-tools/latest/

export PATH="$PATH:${ANDROID_HOME}/cmdline-tools/latest/:${ANDROID_HOME}/cmdline-tools/:${ANDROID_HOME}/:${ANDROID_HOME}/cmdline-tools/latest/bin/"

echo '# ---- ---- ---- ----"' | tee -a ~/.bashrc | tee -a ~/.shrc | tee -a ~/.zshrc | tee -a ~/.profile
echo '# ---- Android SDK"' | tee -a ~/.bashrc | tee -a ~/.shrc | tee -a ~/.zshrc | tee -a ~/.profile
echo 'export PATH="$PATH:${ANDROID_HOME}/cmdline-tools/latest/:${ANDROID_HOME}/cmdline-tools/:${ANDROID_HOME}/:${ANDROID_HOME}/cmdline-tools/latest/bin/"' | tee -a ~/.bashrc | tee -a ~/.shrc | tee -a ~/.zshrc | tee -a ~/.profile
echo 'export ANDROID_HOME=${ANDROID_HOME}/' | tee -a ~/.bashrc | tee -a ~/.shrc | tee -a ~/.zshrc | tee -a ~/.profile



sdkmanager --list --newer | grep build-tools | tail -n 15
sdkmanager --list --newer | grep patch | tail -n 15
sdkmanager --list --newer | grep platforms | tail -n 15

export ANDROID_API_LEVEL=33
sdkmanager --install "build-tools;${ANDROID_API_LEVEL}.0.2" "platforms;android-${ANDROID_API_LEVEL}"

mkdir ~/.android/
touch ~/.android/repositories.cfg


# https://gist.github.com/Ashok-Varma/6b5864c1e444a3f1b61158254a43c4bc

# # Check gradle version - To Verify gradle path
gradle -v

# Verify jre path
java -version

# Verify jdk path
javac -version

# Verify tools path
android list device

# Verify platform-tools path
adb devices


# <<<<<<<<<<<<<<<<<<<<<<<< GRADLE
export GRADLE_VERSION=8.0.2
curl -LO https://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip

mkdir -p ./dezippemoi2/

unzip ./gradle-${GRADLE_VERSION}-bin.zip -d ./dezippemoi2/

ls -alh ./dezippemoi2/
ls -alh ./dezippemoi2/gradle-${GRADLE_VERSION}/

export GRADLE_HOME=~/.gradle.pesto
mkdir -p ${GRADLE_HOME}/gradle-${GRADLE_VERSION}/
cp -fR ./dezippemoi2/gradle-${GRADLE_VERSION}/* ${GRADLE_HOME}/gradle-${GRADLE_VERSION}/

${GRADLE_HOME}/gradle-${GRADLE_VERSION}/bin/gradle --version 


export PATH="$PATH:${GRADLE_HOME}/gradle-${GRADLE_VERSION}/bin/"
gradle --version

echo '# ---- ---- ---- ----"' | tee -a ~/.bashrc | tee -a ~/.shrc | tee -a ~/.zshrc | tee -a ~/.profile
echo '# ---- Gradle"' | tee -a ~/.bashrc | tee -a ~/.shrc | tee -a ~/.zshrc | tee -a ~/.profile
echo 'export GRADLE_HOME=~/.gradle.pesto' | tee -a ~/.bashrc | tee -a ~/.shrc | tee -a ~/.zshrc | tee -a ~/.profile
echo 'export GRADLE_VERSION=8.0.2' | tee -a ~/.bashrc | tee -a ~/.shrc | tee -a ~/.zshrc | tee -a ~/.profile
echo 'export PATH="$PATH:${GRADLE_HOME}/gradle-${GRADLE_VERSION}/bin/"' | tee -a ~/.bashrc | tee -a ~/.shrc | tee -a ~/.zshrc | tee -a ~/.profile
# https://gist.github.com/Ashok-Varma/6b5864c1e444a3f1b61158254a43c4bc

