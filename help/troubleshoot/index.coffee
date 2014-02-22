#
# # Troubleshoot
#
# The troubleshoot command will scan the users VM and print out whatever it
# feels is relevant to common problems on Koding. While this command can be
# quite large, the final print is done by exporting a string, same as
# the rest of the help commands.
#
# Note that the troubleshoot commands are usually async, because Node does not
# contain a Sync version of exec and process spawns. As such, this syntax
# is a little more complicated than the normal string return syntax.
#
{colors, colorTable} = require '../../lib/colors'

module.exports = """
This troubleshoot command will analyze your VM for common problems that you may
be experiencing. Following is a list of troubleshoot commands available:
"""+ colorTable("""
\n
  help troubleshoot all           Execute all the troubleshoot commands
  help troubleshoot apache        Troubleshoot your Apache Web Server
  help troubleshoot ftp           Troubleshoot your FTP Server
  help troubleshoot mysql         Troubleshoot your MySQL Server
  help troubleshoot postgres      Troubleshoot your PostgreSQL Server
  help troubleshoot mongo         Troubleshoot your MongoDB Server
""", colors.blue)
