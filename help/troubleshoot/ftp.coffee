#
# # Troubleshoot FTP
#
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

            sudo apt-get install pure-ftpd
        """
      else if stdout is ' * pure-ftpd is not running\n'
        return next """
        PureFTPd is not running. To start the server, use the following command:

          sudo service pure-ftpd start
        """
      else
        return next """
        An error was encountered when attempting to request the PureFTPd
        Status, which may be an indication to a problem. Error:

          Code:     #{err.code}
          Message:  #{err.message}
        """

  # The final "done" check
  steps.push (help) ->
    # Check if their asking for this help specifically.
    if userdata.commands[..].pop() is 'ftp' and not help?
      callback """
      No problems have been identified with FTP
      """
    else callback help

  # Our little iter function, going through each step
  do iter = (help=null) ->
    if help?
      steps.pop() help
    else
      steps.shift() iter

