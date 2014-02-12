#
# # Apache Commands
#
{c} = require '../../lib/colors'

module.exports = """
Restart your Apache web server.

  #{c.b}sudo service apache2 restart#{c.x}

Enable Mod Rewrite.

  #{c.b}sudo a2enmod rewrite#{c.x}

View the last 50 lines from your Apache Error Log.

  #{c.b}sudo tail -n 50 /var/log/apache2/error.log#{c.x}

Clear your Apache Error Log.

  #{c.b}sudo truncate -s 0 /var/log/apache2/error.log#{c.x}

Edit your Site Configuration File.

  #{c.b}sudo nano /etc/apache2/sites-available/default#{c.x}
"""
