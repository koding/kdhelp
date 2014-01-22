#
# # Troubleshoot Apache
#
out = ''

# Check if their asking for this help specifically.
if userdata.commands[..].pop() is 'apache' and out is ''
  out = """
  No problems have been identified with Apache
  """

module.exports = out
