# == Class: spamassassin
#
# This installs and configures spamassassin.
# Optionally razor and pyzor are installed.
#
# This works on Debian.
# Puppet Version >= 3.4.0
#
# === Parameters
#
# [*user*]
#   The user under which spamassissin runs.
#   *Optional* (defaults to debian-spamd)
#
# [*run_user*]
#   The user under which spamassissin runs (e.g. amavis).
#   Needed for razor/pyzor initialization.
#   *Optional* (defaults to debian-spamd)
#
# [*razor*]
#   Install razor?
#   *Optional* (defaults to false)
#
# [*pyzor*]
#   Install pyzor?
#   *Optional* (defaults to false)
#
# [*backports*]
#   Install and pin from Debian Backports?
#   *Optional* (defaults to false)
#
# === Examples
#
# include spamassassin
#
# === Authors
#
# Frederik Wagner <wagner@wagit.de>
#
# === Copyright
#
# Copyright 2014 Frederik Wagner
#
class spamassassin (
  $user      = 'debian-spamd',
  $run_user  = 'debian-spamd',
  $razor     = false,
  $pyzor     = false,
  $backports = false,
) {
  validate_string($user)
  validate_string($run_user)
  validate_bool($razor)
  validate_bool($pyzor)
  validate_bool($backports)

  contain spamassassin::install
  contain spamassassin::install_addons
  contain spamassassin::config
  contain spamassassin::initial_update

  Class['spamassassin::install']
  -> Class['spamassassin::install_addons']
  -> Class['spamassassin::config']

  Class['spamassassin::install']
  ~> Class['spamassassin::initial_update']

}
