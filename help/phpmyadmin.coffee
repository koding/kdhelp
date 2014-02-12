# 
# # phpmyadmin Help
#
{c} = require '../lib/colors'
module.exports = """
phpMyAdmin is isntalled by default on your VM. To access it, visit:

  #{c.y}#{userdata.vmDomain}/phpmyadmin#{c.x}

To login you will need to set a MySQL password manually. This can be done with
the following command:

  #{c.b}mysqladmin -u root password NEWPASSWORD#{c.x}

Now when you visit phpmyadmin, login with the following credentials:

  User:   #{c.c}root#{c.x}
  Pass:   #{c.c}NEWPASSWORD#{c.x}

Replace "#{c.c}NEWPASSWORD#{c.x}" with your MySQL Password of choice.

As always, additional help can be found on Koding University at:
  http://learn.koding.com
"""
