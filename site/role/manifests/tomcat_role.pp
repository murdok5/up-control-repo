class role::tomcat_role {

    include profile::base
	include profile::apps::tomcat
	include profile::apps::java
	
}