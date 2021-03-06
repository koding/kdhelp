# 
# # MySQL Help
#
{c} = require '../lib/colors'

module.exports = """
MySQL comes preinstalled with the Koding VMs, and can be logged into by typing
the following command:

  #{c.b}mysql -uroot#{c.x}

You should note that the `#{c.g}-p#{c.x}` flag is not included in that command. That is
because there is no root user password by default. You can assign a password
with the following command:

  #{c.b}mysqladmin -u root password NEWPASSWORD#{c.x}

When entering MySQL login details into your applications, make sure you log in
from localhost, not your VM Hostname.
"""
