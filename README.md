# tip-wlan-cloud-workspace
Aggregation of repositories to simplify development environment.

Build instructions:
* make sure that java SDK 9+ is installed
* make sure maven is installed
* configure maven settings.xml with repository credentials
* $ git submodule update --init
* $ mvn -B --file all-modules-build/pom.xml clean install

Results of the build will be the executable jar file in tip-wlan-opensync-wifi-controller/opensync-gateway-static-process/target/opensync-gateway-static-process-0.0.1-SNAPSHOT.jar
