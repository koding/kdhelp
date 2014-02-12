# 
# # FTP Help
# 
{c} = require '../lib/colors'

module.exports = """
FTP is not enabled by default, but can be installed with the following command:

  #{c.b}sudo apt-get install pure-ftpd#{c.x}

When prompted for a password, enter your Koding Password.

After PureFTPd is installed, you can connect to this VM by entering the
following information into your FTP Program:

  Host:#{c.y} ftp.koding.com#{c.x}
  User:#{c.y} #{userdata.username}@#{userdata.hostname}#{c.x}

All other settings should be left in their defaults in most cases. For
additional help please see the Koding University at:

  http://learn.koding.com
"""
