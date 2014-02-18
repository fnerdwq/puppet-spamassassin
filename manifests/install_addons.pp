# installs optionally razor and pyzor (private)
class spamassassin::install_addons {

  if $spamassassin::razor {
    package {'razor': ensure => latest }
  }

  if $spamassassin::pyzor {
    package {'pyzor': ensure => latest }
  }

}
