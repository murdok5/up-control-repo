# :-)
class role::tomcat_role {
	include profile::baseline::linux
	include profile::apps::tomcat
	include profile::apps::java
}
