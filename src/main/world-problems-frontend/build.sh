# Go to this script's directory.
cd "$(dirname "$0")"
# Change according to where you have your dart pub file.
/Applications/dart/dart-sdk/bin/pub build web --mode=debug
# Copy files to webapp/.
cp -R build/web/* ../webapp/
# Remove the build directory.
rm -fr build/

# LEGACY: run maven (now, it's the other way around - maven runs this script)
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home
#cd ../../../
#mvn package
#cd -
