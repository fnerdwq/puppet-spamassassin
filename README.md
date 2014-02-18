#puppet-spamassassin

####Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What spamassassin affects](#what-spamassassin-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with spamassassin](#beginning-with-spamassassin)
4. [Usage](#usage)
5. [Limitations](#limitations)
6. [TODOs](#todos)

##Overview

This small spamassassin module installs and configure spamassassin.
Optionally razor and pyzor can be managed.

Written for Puppet >= 3.4.0.

##Module Description

See [Overview](#overview) for now.

##Setup

###What spamassassin affects

* Installs spamassassin.
* Installs the cron update jog.
* Optionally installs razor.
* Optionally installs pyzor.

###Setup Requirements

Nothing.
	
###Beginning with spamassassin	

Simply include it.

##Usage

Just include the module by 

```puppet
include spamassassin
```

##Limitations:

Tested only on 
* Debian 7
so far.

Puppet Version >= 3.4.0, due to specific hiera/*contain* usage.

##TODOs:

* Make it work on RedHat like systems.
* Make mare configurable.
* ... suggestions? Open an issue on github...
