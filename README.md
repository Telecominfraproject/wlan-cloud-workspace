# wlan-cloud-workspace
Aggregation of repositories to simplify development environment.

Build instructions:
* make sure that java SDK 13+ is installed
* make sure maven is installed
* configure maven settings.xml with repository credentials:
  copy [maven_settings_template.xml](https://github.com/Telecominfraproject/wlan-cloud-workspace/blob/master/.github/workflows/maven_settings_template.xml) into ~/.m2/settings.xml and replace ${env.MAVEN_REPO_USERNAME} / ${env.MAVEN_REPO_PASSWORD} with **tip-read**
* $ git submodule update --init
* $ mvn -B --file all-modules-build/pom.xml clean install

## Results of the build:
### Executable jar files:
All the applications in this section by default use the certificates generated by scripts in [wlan-pki-cert-scripts](https://github.com/Telecominfraproject/wlan-pki-cert-scripts) repository. They expect the certificates to be in /opt/tip-wlan/certs directory. All the settings - filenames, paths, passwords are configurable via environment variables and java system properties. For configuration details please see the CloudSDK  Configuration Guide (TBD).
  
* wlan-opensync-wifi-controller/opensync-gateway-static-process/target/opensync-gateway-static-process-0.0.1-SNAPSHOT.jar

> 
Stand-alone opensync gateway, statically configured by config files

* all-cloud-in-one-process/target/all-cloud-in-one-process-0.0.1-SNAPSHOT.jar

> 
All cloud services exposed via REST APIs. The interface definitions for the APIs can be found in [portal-services-openapi.yaml](https://github.com/Telecominfraproject/wlan-cloud-services/blob/master/portal-services/src/main/resources/portal-services-openapi.yaml)

* all-cloud-and-opensync-gw-in-one-process/target/all-cloud-and-opensync-gw-in-one-process-0.0.1-SNAPSHOT.jar

> 
All cloud services and the opensync gateway that is integrated with the rest of the cloud. In this process the opensync gateway is dynamically configured by the REST APIs of the CloudSDK.

* portal-process/target/portal-process-0.0.1-SNAPSHOT.jar

> 
This process hosts externally visible REST APIs and communicates with other cloud processes. 

* prov-process/target/prov-process-0.0.1-SNAPSHOT.jar

> 
This process hosts provisioning REST APIs. Communicates with RDBMS (PostgreSQL).  

* ssc-process/target/ssc-process-0.0.1-SNAPSHOT.jar

> 
This process hosts REST APIs that deal with system events, service metrics, status objects, alarms, etc. Communicates with a NoSQL database (Cassandra) and queueing/messaging system (Kafka).
 

* spc-process/target/spc-process-0.0.1-SNAPSHOT.jar

> 
This process hosts stream processors. Communicates with queueing/messaging system (Kafka) and with the rest of the CloudSDK services via REST APIs.

* opensync-gateway-cloud-process/target/opensync-gateway-cloud-process-0.0.1-SNAPSHOT.jar

> 
This process hosts dynamically configured opensync gateway. Communicates with the rest of the CloudSDK services via REST APIs.  

### Docker images:
This repository automatically publishes docker images with the above processes into [tip-wlan-cloud-docker-repo in JFrog](https://tip.jfrog.io/artifactory/tip-wlan-cloud-docker-repo/)
