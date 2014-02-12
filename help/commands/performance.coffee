#
# # Performance Related Commands
#
{c} = require '../../lib/colors'

module.exports = """
View the uptime of this VM.

  #{c.b}uptime#{c.x}

View the a list of active processes, and what resources they are using.

  #{c.b}top -n 5#{c.x}

Ping a domain or IP with a count of 20.

  #{c.b}ping -c 20 DOMAIN / IP#{c.x}
"""
