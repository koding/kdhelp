#
# # Troubleshoot MySQL
#
out = ''

# Check if their asking for this help specifically.
if userdata.commands[..].pop() is 'mysql' and out is ''
  out = """
  No problems have been identified with MySQL
  """

module.exports = out
