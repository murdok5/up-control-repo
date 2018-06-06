class profile::baseline::linux {

  # RHN vs. Spacewalk
  # Timezone
  class { 'timezone':
      timezone => 'America/Los_Angeles',
  }
  # NTP
  class { 'ntp':
    servers => [ 'tick.campus.up.edu', 'tock.campus.up.edu' ],
  }

  # Shorewall - 22 Tyson - Nagios

  # Sudo

  class { 'sudo':
    purge               => false,
    config_file_replace => false,
  }
  sudo::conf { 'LinuxAdmin':
    content => "%CAMPUS\\\\LinuxAdmin ALL=(ALL) NOPASSWD: ALL",
  }
  sudo::conf { 'sudo':
    content => "%sudo ALL=(ALL) NOPASSWD: ALL",
  }
  sudo::conf { 'wheel':
    content => "%wheel ALL=(ALL) NOPASSWD: ALL",
  }

  # Nagios
  # nagios user, dev or prd group, password,

  # SE Linux Enforce
  class { selinux:
    mode => 'enforcing',
    type => 'targeted',
  }
}
