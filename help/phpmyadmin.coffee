# 
# # phpmyadmin Help
#
module.exports = """
phpMyAdmin is isntalled by default on your VM. To access it, visit:

  #{userdata.vmDomain}/phpmyadmin

To login you will need to set a MySQL password manually. This can be done with
the following command:

  mysqladmin -u root password NEWPASSWORD

Now when you visit phpmyadmin, login with the following credentials:

  User:   root
  Pass:   NEWPASSWORD

Replace "NEWPASSWORD" with your MySQL Password of choice.

As always, additional help can be found on Koding University at:
  http://learn.koding.com
"""
