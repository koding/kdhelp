# 
# # SSH Help
#
{c} = require '../lib/colors'

module.exports = """
To SSH into this VM, you need to add your pubkey to your Koding Account at:

  https://koding.com/Account

Now create your SSH Config file, on #{c.r}your home machine#{c.x} located
at #{c.y}~/.ssh/config#{c.x}, and populate it
with the following text:#{c.c}

  Host vm-*
    User #{userdata.username}
    ProxyCommand ssh %r@ssh.koding.com nc %h.%r.koding.kd.io %p

#{c.x}Lastly, make sure that your VM is on and that you are logged into Koding. Then
type the following command to SSH into Koding:

  #{c.b}ssh #{userdata.vm}#{c.x}

That's it! For more detailed instructions, please visit the following tutorial:
  http://learn.koding.com/ssh-into-your-koding-vm/
"""
