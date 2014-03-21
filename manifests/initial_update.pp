# initial spamassassin update (private)
class spamassassin::initial_update {

  exec {'update spamassassin':
    command     => "su - ${spamassassin::user} -c 'sa-update --gpghomedir \$HOME/sa-update-keys'",
    refreshonly => true,
    returns     => [0,1],
    path        => ['/bin','/usr/bin'],
  }

}
