# blah blah blah
class profile::apps::java {

  java::oracle { 'jdk8' :
    ensure  => 'present',
    version => '8',
    java_se => 'jdk',
  }

  file { '/usr/java/latest':
    ensure  => link,
    target  => "${::java_default_home}",
    require => Java::Oracle['jdk8'],
  }
}
