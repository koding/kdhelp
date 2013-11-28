# 
# # FTP Help
# 
module.exports = """
FTP is not enabled by default, but can be installed with the following command:

  sudo apt-get install pure-ftpd

When prompted for a password, enter your Koding Password.

After PureFTPd is installed, you can connect to this VM by entering the
following information into your FTP Program:

  Host: ftp.koding.com
  User: #{userdata.username}@#{userdata.hostname}

All other settings should be left in their defaults in most cases. For
additional help please see the Koding University at:

  http://learn.koding.com
"""
