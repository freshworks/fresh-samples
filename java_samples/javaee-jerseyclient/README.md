## JavaEE Sample

Example uses a servlet to create a Freshdesk ticket from a HTML form.

### Configure API Key and Freshdesk Domain

These are in the properties file [fd.properties](https://github.com/freshdesk/fresh-samples/blob/master/java_samples/javaee-jerseyclient/src/main/resources/fd.properties). Change the property and build.

### Build

[Maven](http://maven.apache.org/) is required to build this project. To build:

$ mvn package

### Deploy

Requires a JavaEE server like [Tomcat](http://tomcat.apache.org/) or [Glassfish](https://glassfish.java.net/).

### Run

For example, if you are deploying in the Tomcat container with default configuration, the URL to access the app: [http://localhost:8080/javaee-jerseyclient](http://localhost:8080/javaee-jerseyclient/).
