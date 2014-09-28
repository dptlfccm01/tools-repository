#!/c:/strawberry/perl/bin/perl.exe

# Instructions:
# On the command prompt, enter:
# Template.pl <projectname> <groupId> <directory_location_where_folder_structure_is_created>
# e.g. Template.pl NewProject com.newproject.app C:\myworkspace
# 
#======================================================================================================================================================
# VERSION HISTORY
# 1. 25/09/2014 	Dependencies need to be added via the command line. 
#					e.g. Template.pl myNewProject com.mynewProject c:\ JUnit JSTL ServletAPI Taglibs SpringMVC
# 2. 28/09/2014		Updated the code base for creating a project that contains the spring annotation.
#					(When the project is deployed, ensure that you launch the following URL in the browser:
#					http://localhost:8080/DummyProject/test
#					Run the command on the command line to create the maven project:
#					Template-updated.pl myNewProject com.mynewProject c:\ JUnit JSTL ServletAPI Taglibs SpringMVC
#
#======================================================================================================================================================

use strict;
use warnings;

my $projectName = $ARGV[0];
my $projectGroupId = $ARGV[1];
my $projectLocation = $ARGV[2];
my $numberOfArgs = $#ARGV + 1;

sub createSpringServletConfigFile{
	my $xml = "";
	$xml .="<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<beans xmlns=\"http://www.springframework.org/schema/beans\"
		xmlns:context=\"http://www.springframework.org/schema/context\"
		xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"
		xmlns:mvc=\"http://www.springframework.org/schema/mvc\"
		xsi:schemaLocation=\"http://www.springframework.org/schema/beans
		http://www.springframework.org/schema/beans/spring-beans.xsd
		http://www.springframework.org/schema/context
		http://www.springframework.org/schema/context/spring-context.xsd
		http://www.springframework.org/schema/mvc
		http://www.springframework.org/schema/mvc/spring-mvc.xsd\">
		
	
	<bean id=\"HandlerMapping\" class=\"org.springframework.web.servlet.handler.BeanNameUrlHandlerMapping\"/>
	
	<context:component-scan base-package=\"com.example.app.MyNewProject\" />
	<mvc:annotation-driven/>
	
	<bean id=\"viewResolver\" class=\"org.springframework.web.servlet.view.InternalResourceViewResolver\">
		<property name=\"viewClass\" value=\"org.springframework.web.servlet.view.JstlView\"></property>
		<property name=\"prefix\" value=\"/WEB-INF/jsp/\"></property>
		<property name=\"suffix\" value=\".jsp\"></property>
	</bean>
</beans>
";
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

	foreach my $arg (@ARGV){
		if($arg eq "JUnit"){
			$xml .= dependencyJUnit();
		}
		if($arg eq "ServletAPI"){
			$xml .= dependencyServletAPI();
		}
		if($arg eq "JSTL"){
			$xml .= dependencyJSTL();
		}
		if($arg eq "JSP"){
			$xml .= dependencyJSP();
		}
		if($arg eq "SpringMVC"){
			$xml .= dependencySpringMVC();
		}
		if($arg eq "Taglibs"){
			$xml .= dependencyTaglibs();
		}
	}
	
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
	$xml .="<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<web-app xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns=\"http://java.sun.com/xml/ns/javaee\" xmlns:web=\"http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd\" xsi:schemaLocation=\"http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd\" id=\"WebApp_ID\" version=\"2.5\">
<display-name>MyNewproject</display-name>
<servlet>
<servlet-name>springapp</servlet-name>
<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
</servlet>
<servlet-mapping>
<servlet-name>springapp</servlet-name>
<url-pattern>/</url-pattern>
</servlet-mapping>
<welcome-file-list>
<welcome-file>index.html</welcome-file>
<welcome-file>index.htm</welcome-file>
<welcome-file>index.jsp</welcome-file>
<welcome-file>default.html</welcome-file>
<welcome-file>default.htm</welcome-file>
<welcome-file>default.jsp</welcome-file>
</welcome-file-list>

</web-app>
	";
	return $xml;
}

sub dependencyServletAPI{
	my $xml ="<dependency>\n";
	$xml .="<groupId>javax.servlet</groupId>\n";
	$xml .="<artifactId>servlet-api</artifactId>\n";
	$xml .="<version>2.4</version>\n";
	$xml .="<scope>provided</scope>\n";
	$xml .="</dependency>\n";	
	return $xml;
}

sub dependencyJSP{
	my $xml ="<dependency>\n";
	$xml .="<groupId>javax.servlet.jsp</groupId>\n";
	$xml .="<artifactId>jsp-api</artifactId>\n";
	$xml .="<version>2.1</version>\n";
	$xml .="<scope>provided</scope>\n";
	$xml .="</dependency>\n";
	return $xml;
}

sub dependencyJUnit{
	my $xml ="<dependency>\n";
	$xml .="<groupId>junit</groupId>\n";
	$xml .="<artifactId>junit</artifactId>\n";
	$xml .="<version>4.0</version>\n";
	$xml .="<type>jar</type>\n";
	$xml .="<scope>test</scope>\n";
	$xml .="<optional>true</optional>\n";
	$xml .="</dependency>\n";
	return $xml;
}

sub dependencyJSTL{
	my $xml ="<dependency>\n";
	$xml .="<groupId>javax.servlet</groupId>\n";
	$xml .="<artifactId>jstl</artifactId>\n";
	$xml .="<version>1.1.2</version>\n";
	$xml .="</dependency>\n";
	return $xml;
}

sub dependencyTaglibs{
	my $xml ="<dependency>\n";
	$xml .="<groupId>taglibs</groupId>\n";
	$xml .="<artifactId>standard</artifactId>\n";
	$xml .="<version>1.1.2</version>\n";
	$xml .="</dependency>\n";
	return $xml;
}


sub dependencySpringMVC{
	my $xml ="<dependency>\n";
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
	
	return $xml;
}

sub createSampleJavaController{
my $c = "";
$c .="package com.example.app.MyNewProject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

\@Controller
public class SampleController {

	\@RequestMapping(\"/test\")
	public ModelAndView helloWorld(){
		ModelAndView m = new ModelAndView(\"hello\");
		m.addObject(\"msg\", \"Hello world\");
		return m;
	}
}
";
return $c;
}

sub createIncludeJSP{
my $val = "";
$val .="<%@ page session=\"false\"%>
<%@ taglib prefix=\"c\" uri=\"http://java.sun.com/jsp/jstl/core\" %>
<%@ taglib prefix=\"fmt\" uri=\"http://java.sun.com/jsp/jstl/fmt\" %>";
return $val;

}

sub createSampleJSPView{
my $val ="";
$val .="<%@ page language=\"java\" contentType=\"text/html; charset=ISO-8859-1\"
    pageEncoding=\"ISO-8859-1\"%>
<%@ include file=\"/WEB-INF/jsp/include.jsp\" %>
<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">
<html>
<head>
<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">
<title>Insert title here</title>
</head>
<body>
<h1>Spring application</h1>
<p>Greetings, it is now <c:out value=\"\${msg}\" /></p>
</body>
</html>";
return $val;
}


sub createSample404Page{
	my $val = "";
	$val .="<%@ page language=\"java\" contentType=\"text/html; charset=ISO-8859-1\"
    pageEncoding=\"ISO-8859-1\"%>
<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">
<html>
<head>
<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">
<title>Sample Error Page</title>
</head>
<body>
<h2>Access Denied!</h2>
</body>
</html>";
return $val;
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
	mkdir("$projectLocation/$projectName");
	mkdir("$projectLocation/$projectName/src");
	mkdir("$projectLocation/$projectName/src/main");
	mkdir("$projectLocation/$projectName/src/main/java");
	mkdir("$projectLocation/$projectName/src/main/java/com");
	mkdir("$projectLocation/$projectName/src/main/java/com/example");
	mkdir("$projectLocation/$projectName/src/main/java/com/example/app");
	mkdir("$projectLocation/$projectName/src/main/java/com/example/app/MyNewProject");
	mkdir("$projectLocation/$projectName/src/main/webapp");
	mkdir("$projectLocation/$projectName/src/main/webapp/WEB-INF");
	mkdir("$projectLocation/$projectName/src/main/webapp/WEB-INF/jsp");
	mkdir("$projectLocation/$projectName/src/test");
	mkdir("$projectLocation/$projectName/src/test/java");	
	mkdir("$projectLocation/$projectName/src/resources");	
	mkdir("$projectLocation/$projectName/target");

	# create directory for java package to store a controller class as a placeholder
	
	
}

sub main{
	if($numberOfArgs < 3){
		print("ERR> Please enter the project name and project group ID as arguments\n");
	}
	else{
		createDirectories();
		runFileController("$projectLocation/$projectName/src/main/webapp/WEB-INF/springapp-servlet.xml",createSpringServletConfigFile());
		runFileController("$projectLocation/$projectName/pom.xml", createPOMFile($projectName, $projectGroupId));
		runFileController("$projectLocation/$projectName/src/main/webapp/WEB-INF/web.xml", createDeploymentDescriptorFile());
		runFileController("$projectLocation/$projectName/src/main/java/com/example/app/MyNewProject/SampleController.java", createSampleJavaController());
		runFileController("$projectLocation/$projectName/src/main/webapp/WEB-INF/jsp/include.jsp", createIncludeJSP());
		runFileController("$projectLocation/$projectName/src/main/webapp/WEB-INF/jsp/hello.jsp", createSampleJSPView());
		runFileController("$projectLocation/$projectName/src/main/webapp/WEB-INF/jsp/error.jsp", createSample404Page());
		
		print ("OUT> MVN Project Name = $ARGV[0]\n");
		print ("OUT> MVN Project Group ID = $ARGV[1]\n");
	}
}

main();