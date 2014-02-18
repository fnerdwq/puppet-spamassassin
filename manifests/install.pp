# installs spamassassin (private)
class spamassassin::install {

  package {'spamassassin': ensure => latest }

}
