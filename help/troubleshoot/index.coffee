#
# # Troubleshoot
#
# The troubleshoot command will scan the users VM and print out whatever it
# feels is relevant to common problems on Koding. Note that this command can be
# quite large, and that the final print is done by exporting a string, same as
# the rest of the help commands.
#
# Note that the troubleshoot commands are usually async, because Node does not
# contain a Sync version of exec and process spawns. As such, this syntax
# is a little more complicated than the normal string return syntax.
#
module.exports = (cb) ->
  troubleshooterPaths = [
    './apache'
    './mysql'
  ]

  out = ''
  done = ->
    if out is ''
      out = """
      No problems have been identified with your VM.
      """
    cb out

  do iter = ->
    ts = troubleshooterPaths.shift()
    if not ts? then return done()
    ts = require ts
    if typeof ts is 'string'
      out += ts
      return iter()
    ts (help='') ->
      out += "\n#{help}"
      iter()
