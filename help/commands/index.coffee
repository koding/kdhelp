#
# # Commands Help
#
{c, colors, colorTable} = require '../../lib/colors'

module.exports = """
The following is a list of useful Linux commands. Type them in full, as shown,
for help in that category.
"""+ colorTable("""
\n
  help commands apache          Commands related to your Apache Web Server
  help commands files           File and Disk related commands
  help commands misc            Miscellaneous commands
  help commands mysql           Commands related to MySQL
  help commands performance     Performance related commands
""", colors.blue)+ """

Remember, for any commands that require sudo, see `#{c.b}help sudo#{c.x}`
"""
