#!/c:/strawberry/perl/bin/perl.exe

use strict;
use warnings;

my $projectName = $ARGV[0];
my $projectGroupId = $ARGV[1];
my $numberOfArgs = $#ARGV + 1;

sub createSpringServletConfigFile{
	my $xml = "";
	$xml .="<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
	$xml .="<beans xmlns=\"http://www.springframework.org/schema/beans\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.springframework.org/schema/beans http://www.springframework/schema/beans/spring-beans-2.5xsd\">\n";
	$xml .="<bean name=\"/hello.htm\" class=\"com.exmaple.app.MyNewProject.HelloController\"/>\n";
	$xml .="<bean id=\"viewResolver\" class=\"org.springframework.web.servlet.view.InternalResourceViewResolver\">\n";
	$xml .="<property name=\"viewClass\" value=\"org.springframework.web.servlet.view.JstlView\"></property>\n";
	$xml .="<property name=\"prefix\" value=\"/WEB-INF/jsp/\"></property>\n";
	$xml .="<property name=\"suffix\" value=\".jsp\"></property>\n";
	$xml .="</bean>\n";
	$xml .="</beans>\n";
	return $xml;
}

sub createPOMFile{
	my $xml ="";
	$xml .="<project xmlns=\"http://maven.apache.org/POM/4.0.0\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd\">\n";
	$xml .="<modelVersion>4.0.0</modelVersion>\n";
	$xml .="<groupId>$_[1]</groupId>\n";
	$xml .="<artifactId>$_[0]</artifactId>\n";
	$xml .="<version>0.0.1-SNAPSHOT</version>\n";
	$xml .="<packaging>war</packaging>\n";
	$xml .="<name>$_[0]</name>\n";
	$xml .="<url>http://maven.apache.org</url>\n";
	$xml .="<dependencies>\n";
	$xml .="<dependency>\n";
	$xml .="<groupId>javax.servlet</groupId>\n";
	$xml .="<artifactId>servlet-api</artifactId>\n";
	$xml .="<version>2.4</version>\n";
	$xml .="<scope>provided</scope>\n";
	$xml .="</dependency>\n";	
	
	$xml .="<dependency>\n";
	$xml .="<groupId>javax.servlet.jsp</groupId>\n";
	$xml .="<artifactId>jsp-api</artifactId>\n";
	$xml .="<version>2.1</version>\n";
	$xml .="<scope>provided</scope>\n";
	$xml .="</dependency>\n";	

	$xml .="<dependency>\n";
	$xml .="<groupId>junit</groupId>\n";
	$xml .="<artifactId>junit</artifactId>\n";
	$xml .="<version>4.0</version>\n";
	$xml .="<type>jar</type>\n";
	$xml .="<scope>test</scope>\n";
	$xml .="<optional>true</optional>\n";
	$xml .="</dependency>\n";		

	$xml .="<dependency>\n";
	$xml .="<groupId>taglibs</groupId>\n";
	$xml .="<artifactId>standard</artifactId>\n";
	$xml .="<version>1.1.2</version>\n";
	$xml .="</dependency>\n";	
	
	$xml .="<dependency>\n";
	$xml .="<groupId>javax.servlet</groupId>\n";
	$xml .="<artifactId>jstl</artifactId>\n";
	$xml .="<version>1.1.2</version>\n";
	$xml .="</dependency>\n";

	$xml .="<dependency>\n";
	$xml .="<groupId>org.springframework</groupId>\n";
	$xml .="<artifactId>spring-context</artifactId>\n";
	$xml .="<version>3.1.1.RELEASE</version>\n";
	$xml .="</dependency>\n";	
	
	$xml .="<dependency>\n";
	$xml .="<groupId>org.springframework</groupId>\n";
	$xml .="<artifactId>spring-asm</artifactId>\n";
	$xml .="<version>3.1.1.RELEASE</version>\n";
	$xml .="</dependency>\n";	

	$xml .="<dependency>\n";
	$xml .="<groupId>org.springframework</groupId>\n";
	$xml .="<artifactId>spring-beans</artifactId>\n";
	$xml .="<version>3.1.1.RELEASE</version>\n";
	$xml .="</dependency>\n";	

	$xml .="<dependency>\n";
	$xml .="<groupId>org.springframework</groupId>\n";
	$xml .="<artifactId>spring-context-support</artifactId>\n";
	$xml .="<version>3.1.1.RELEASE</version>\n";
	$xml .="</dependency>\n";		

	$xml .="<dependency>\n";
	$xml .="<groupId>org.springframework</groupId>\n";
	$xml .="<artifactId>spring-expression</artifactId>\n";
	$xml .="<version>3.1.1.RELEASE</version>\n";
	$xml .="</dependency>\n";		
	
	$xml .="<dependency>\n";
	$xml .="<groupId>org.springframework</groupId>\n";
	$xml .="<artifactId>spring-core</artifactId>\n";
	$xml .="<version>3.1.1.RELEASE</version>\n";
	$xml .="</dependency>\n";	


	$xml .="<dependency>\n";
	$xml .="<groupId>org.springframework</groupId>\n";
	$xml .="<artifactId>spring-web</artifactId>\n";
	$xml .="<version>3.1.1.RELEASE</version>\n";
	$xml .="</dependency>\n";		
	
	
	$xml .="<dependency>\n";
	$xml .="<groupId>org.springframework</groupId>\n";
	$xml .="<artifactId>spring-webmvc</artifactId>\n";
	$xml .="<version>3.1.1.RELEASE</version>\n";
	$xml .="</dependency>\n";
	
	$xml .="</dependencies>";
	
	$xml .="<build>\n<plugins>\n<plugin>\n";
	$xml .="<groupId>org.apache.maven.plugins</groupId>\n";
	$xml .="<artifactId>maven-compiler-plugin</artifactId>\n";
	$xml .="<version>2.0.2</version>\n";
	$xml .="<configuration>\n";
	$xml .="<source>1.7</source>\n";
	$xml .="<target>1.7</target>\n";
	$xml .="</configuration>\n";
	$xml .="</plugin></plugins>";
	$xml .="<resources><resource><directory>src/resources</directory></resource></resources>";
	$xml .="</build>";
	$xml .="</project>";
	return $xml;
}

sub createDeploymentDescriptorFile{
	my $xml = "";
	$xml .="<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
	$xml .="<web-app xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns=\"http://java.sun.com/xml/ns/javaee\" xmlns:web=\"http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd\" xsi:schemaLocation=\"http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd\" id=\"WebApp_ID\" version=\"2.5\">\n";
	$xml .="<display-name>MyNewproject</display-name>\n";
	$xml .="<servlet>\n";
	$xml .="<servlet-name>springapp</servlet-name>\n";
	$xml .="<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>\n";
	$xml .="</servlet>\n";
	
	$xml .="<servlet-mapping>\n";
	$xml .="<servlet-name>springapp</servlet-name>\n";
	$xml .="<url-pattern>*.htm</url-pattern>\n";
	$xml .="</servlet-mapping>\n";
	
	$xml .="<welcome-file-list>\n";
	$xml .="<welcome-file>index.html</welcome-file>\n";
	$xml .="<welcome-file>index.htm</welcome-file>\n";
	$xml .="<welcome-file>index.jsp</welcome-file>\n";	
	$xml .="<welcome-file>default.html</welcome-file>\n";
	$xml .="<welcome-file>default.htm</welcome-file>\n";
	$xml .="<welcome-file>default.jsp</welcome-file>\n";
	$xml .="</welcome-file-list>\n";
	$xml .="</web-app>\n";
	return $xml;
}

# $_[0] refers to the name of the file to be created (with the extension)
# $_[1] refers to the content of the file, which is represented in the form of a string and stored as a variable.

sub runFileController{
	open (my $fileHandle, '>', $_[0]) or die "cannot create the file";
	my $xmlString = $_[1];
	print ($fileHandle $xmlString);
	close $fileHandle;
}

sub createDirectories{
	mkdir("./$projectName");
	mkdir("./$projectName/src");
	mkdir("./$projectName/src/main");
	mkdir("./$projectName/src/main/java");
	mkdir("./$projectName/src/main/webapp");
	mkdir("./$projectName/src/main/webapp/WEB-INF");
	mkdir("./$projectName/src/main/webapp/WEB-INF/jsp");
	mkdir("./$projectName/src/test");
	mkdir("./$projectName/src/test/java");	
	mkdir("./$projectName/src/resources");	
	mkdir("./$projectName/target");	
}

sub main{
	if($numberOfArgs != 2){
		print("ERR> Please enter the project name and project group ID as arguments\n");
	}
	else{
		createDirectories();
		runFileController("./$projectName/src/main/webapp/WEB-INF/spring-servlet.xml",createSpringServletConfigFile());
		runFileController("./$projectName/pom.xml", createPOMFile($projectName, $projectGroupId));
		runFileController("./$projectName/src/main/webapp/WEB-INF/web.xml", createDeploymentDescriptorFile());
		print ("OUT> MVN Project Name = $ARGV[0]\n");
		print ("OUT> MVN Project Group ID = $ARGV[1]\n");
	}
}

main();