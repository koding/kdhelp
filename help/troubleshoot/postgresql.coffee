#
# # Troubleshoot PostgreSQL
#
{c}    = require '../../lib/colors'
{exec} = require 'child_process'

module.exports = (callback) ->
  # An array of functions, where each function is a troubleshooting step.
  steps = []

  steps.push (next) -> exec 'service postgresql status',
    (err, stdout, stderr) ->
      if err?
        return next """
        There was an error checking the status of PostgreSQL. This in itself may
        be a problem. The error message is below:

          Code:     #{err.code}
          Message:  #{err.message}
        """

      if stdout[-7..-1] is 'online'
        return next()

      else if stdout[-5..-1] is 'down'
        return next """
        PostgreSQL does not appear to be running. Try starting it with the
        following command:

          #{c.b}sudo pg_ctlcluster 9.1 main start#{c.x}
        """

      else
        return next """
        PostgreSQL Status returned an unknown response, which may be a problem
        itself. Response:

          #{stdout}
        """

  # Add a "no problems" message if no help has been found, and this command
  # was executed specifically
  steps.push (next) ->
    if userdata.commands[..].pop() is 'postgresql'
      next """
      No problems have been identified with PostgreSQL
      """
    else next()

  # Our little iter function, going through each step
  do iter = (help=null) ->
    step = steps.shift()
    return callback help  if help?
    return step iter      if step?
    callback()

