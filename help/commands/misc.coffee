#
# # Miscellaneous Commands
#
{c} = require '../../lib/colors'

module.exports = """
View the system log.

  #{c.b}sudo tail -n 50 /var/log/syslog#{c.x}

Enable mail() functionality in PHP.

  #{c.b}sudo apt-get install sendmail; sudo sendmailconfig#{c.x}
"""
