#
# # Apache Commands
#
module.exports = """
Restart your Apache web server.

  sudo service apache2 restart

Enable Mod Rewrite.

  sudo a2enmod rewrite

View the last 50 lines from your Apache Error Log.

  sudo tail -n 50 /var/log/apache2/error.log

Clear your Apache Error Log.

  sudo truncate -s 0 /var/log/apache2/error.log

Edit your Site Configuration File.

  sudo nano /etc/apache2/sites-available/default
"""
