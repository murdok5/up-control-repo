class role::tomcat_role {

    include profile::base
	include profile::tomcat
	include profile::java
	
}