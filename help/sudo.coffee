# 
# # Sudo Help
#
guest_message = """
Sudo access requires that you are registered on Koding. Until then, you have
normal user access to this free VM. Of course, registration is free, easy,
and gives you sudo. Visit the following address to register on Koding:

  https://koding.com/Register
"""

registered_message = """
Your sudo password is the password that you registered on Koding with.
"""

guest = userdata.username[0...6] is 'guest-'

module.exports = """#{if guest then guest_message else registered_message}

If you're not familiar with sudo, the `sudo` command is required to modify
files outside of your home directory, and install programs with `apt-get`.
It should be used *before* your command of choice, for example:

  sudo apt-get install pure-ftpd

Will install an FTP server into your VM. Sudo will prompt you for your Koding
password, and when you enter it, the command will continue normally.

As always, additional help can be found on Koding University at:
  http://learn.koding.com
"""
