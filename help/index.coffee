#
# # Koding Help Index
#
# Each file in this directory represents a "command" to the `kdhelp` bin.
#
# To create a help item, simply add a coffee file to this directory and export
# a string to the `module.exports` object. For example,
# `module.exports = 'This is the help for my command'`
#
# It really is that simple. Directories with an index file will be parsed as a
# command, and modules(files) within that directory will be treated as
# subcommands.
#
# Note that because we are executing Coffee(JavaScript), you are free to run
# logic in these help files if you want to customize them for the user
# experience. Just ensure that you export a string, and all is good.
#
# For additional help on contributing, please refer to the KDHelp project
# located at https://github.com/koding/kdhelp
#
{c, colors, colorTable} = require '../lib/colors'

module.exports = """
Hello #{userdata.username}, to receive help in one of the following areas
simply type "#{c.b}help #{c.x}" followed by the thing you want help with, and then hit
enter. For example, type "#{c.b}help this#{c.x}" and then press enter on your keyboard.

The following is a list of popular help topics, type "#{c.b}help list#{c.x}" for more:
"""+ colorTable("""
\n
  help this             What the heck is this?
  help troubleshoot     Attempt to identify common problems.
  help commands         What are some common Linux commands?
  help web              How can I view web files?
  help programs         What comes pre installed on Koding?
  help sudo             What is my sudo pass?
  help ssh              How can I SSH into my VM?
  help specs            What are my VMs specifications?
  help mysql            How can I connect to my MySQL server on Koding?
  help ftp              How can I connect to my VM through FTP?
  help phpmyadmin       How do I access phpMyAdmin?
  help mining           Can I use Koding for CPU Mining?
""", colors.blue)+  """

As always, additional help can be found on Koding University at:
  http://learn.koding.com

Or from the Koding community, at:
  https://koding.com/Activity
"""
