# here is a comment
class profile::apps::tomcat {
  tomcat::install { '/opt/tomcat8':
    source_url => 'https://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.31/bin/apache-tomcat-8.5.31.tar.gz',
  }

  tomcat::instance { 'tomcat8':
    catalina_home => '/opt/tomcat8',
  }
  tomcat::config::server { 'tomcat8':
    catalina_base => '/opt/tomcat8',
    port          => '8105',
  }
  tomcat::config::server::connector { 'tomcat8-http':
    catalina_base         => '/opt/tomcat8',
    port                  => '8180',
    protocol              => 'HTTP/1.1',
    additional_attributes => {
      'redirectPort' => '8543'
    },
  }

  file { '/opt/tomcat8/webapps/hello-world.war':
    ensure => 'present',
    source => 'https://github.com/efsavage/hello-world-war/blob/master/dist/hello-world.war',
  }
}
