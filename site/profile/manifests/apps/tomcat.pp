# here is a comment
class profile::apps::tomcat {
  tomcat::install { '/opt/tomcat':
    source_url => 'https://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.31/bin/apache-tomcat-8.5.31.tar.gz',
  }
  tomcat::instance { 'default':
    catalina_home => '/opt/tomcat',
  }
  tomcat::config::server { 'default':
    catalina_base => '/opt/tomcat',
    port          => '80',
  }
}
