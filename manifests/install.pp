# installs spamassassin (private)
class spamassassin::install {

  if $spamassassin::backports {
    include apt::backports

    $release = downcase($::lsbdistcodename)
    apt::pin { 'pin_spamassassin_release':
      packages => 'spamassassin',
      release  => "${release}-backports",
      priority => '995',
    }

    Class['apt::backports']
    -> Package['spamassassin']
  }

  package {'spamassassin': ensure => latest }

}
