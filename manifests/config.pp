# configures spamassassin, optionally pyzor and razor (private)
class spamassassin::config {

  # enable cron update
  augeas {'/etc/default/spamassassin':
    context => '/files/etc/default/spamassassin',
    changes => 'set CRON 1',
  }

  if $spamassassin::pyzor {
      exec {'pyzor discover':
      command     => "su - ${spamassassin::run_user} -c 'pyzor discover'",
      unless      => "su - ${spamassassin::run_user} -c 'test -d .pyzor'",
      path        => ['/bin','/usr/bin'],
      }
  }

  if $spamassassin::razor {
    exec {'razor-admin -create':
      command     => "su - ${spamassassin::run_user} -c 'razor-admin -create'",
      unless      => "su - ${spamassassin::run_user} -c 'test -d .razor'",
      path        => ['/bin','/usr/bin'],
      notify      => Exec['razor-admin -register'],
    }
    exec {'razor-admin -register':
      command     => "su - ${spamassassin::run_user} -c 'razor-admin -register'",
      refreshonly => true,
      path        => ['/bin','/usr/bin'],
    }
  }

}
