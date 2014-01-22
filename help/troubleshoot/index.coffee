#
# # Troubleshoot
#
# The troubleshoot command will scan the users VM and print out whatever it
# feels is relevant to common problems on Koding. Note that this command can be
# quite large, and that the final print is done by exporting a string, same as
# the rest of the help commands.
#
out = ''
out += require './apache'
out += require './mysql'

if out is ''
  out = """
  No problems have been identified with your VM.
  """

module.exports = out
