/Applications/dart/dart-sdk/bin/pub build web --mode=debug
cp -R build/web/* ../webapp/
rm -fr build/
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home
cd ../../../
mvn package
cd -
