#
# # MySQL Related Commands
#
{c} = require '../../lib/colors'

module.exports = """
Start MySQL

  #{c.b}sudo service mysql start#{c.x}

Assign a MySQL Password to the default MySQL root user:

  #{c.b}mysqladmin -u root password NEWPASSWORD#{c.x}
"""
