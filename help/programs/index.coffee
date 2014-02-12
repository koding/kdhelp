# 
# # Programs Help
# 
{c} = require '../../lib/colors'

module.exports = """
Koding Virtual Machines come with a good number of applications and libraries
already installed and running for your convenience. Following is a list of
noteworthy programs already installed on your VM, with the help command
listed on the right side of the command so you can get more information
about that specific program.

  MySQL           #{c.b}help mysql#{c.x}
  MongoDB         #{c.b}help mongodb#{c.x}
  PHPMyAdmin
  PHPPGAdmin
  PGSql

Along with a handful of libraries:

  php5-mongo, zend-framework-bin, php5-MySQL, php5-gd, php5-common, php5-cli,
  libapache2-mod-php5

As always, additional help can be found on Koding University at:
  http://learn.koding.com
"""
