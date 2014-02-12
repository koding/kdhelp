#
# # Troubleshoot FTP
#
{c}    = require '../../lib/colors'
{exec} = require 'child_process'

module.exports = (callback) ->
  # An array of functions, where each function is a troubleshoot step.
  steps = []

  # Check if it's running
  steps.push (next) -> exec 'service pure-ftpd status', (err, stdout, stderr) ->
    if err?
      # Note the stderr vs stdout usage here.. `service` seems to write to both
      # of them o_O
      if stderr is 'pure-ftpd: unrecognized service\n'
        return next """
          PureFTPd is not installed. To install it, use the following command:

            #{c.b}sudo apt-get install pure-ftpd#{c.x}
        """
      else if stdout is ' * pure-ftpd is not running\n'
        return next """
        PureFTPd is not running. To start the server, use the following command:

          #{c.b}sudo service pure-ftpd start#{c.x}
        """
      else
        return next """
        An error was encountered when attempting to request the PureFTPd
        Status, which may be an indication to a problem. Error:

          Code:     #{err.code}
          Message:  #{err.message}
        """
    next()


  # Add a "no problems" message if no help has been found, and this command
  # was executed specifically
  steps.push (next) ->
    if userdata.commands[..].pop() is 'ftp'
      next """
      No problems have been identified with FTP
      """
    else next()

  # Our little iter function, going through each step
  do iter = (help=null) ->
    step = steps.shift()
    return callback help  if help?
    return step iter      if step?
    callback()

