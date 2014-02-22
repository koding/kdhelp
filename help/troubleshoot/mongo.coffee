#
# # Troubleshoot Mongo
#
{c}    = require '../../lib/colors'
{exec} = require 'child_process'

module.exports = (callback) ->
  # An array of functions, where each function is a troubleshooting step.
  steps = []

  steps.push (next) -> exec 'service mongodb status',
    (err, stdout, stderr) ->
      if err?
        return next """
        There was an error checking the status of MongoDB. This in itself may
        be a problem. The error message is below:

          Code:     #{err.code}
          Message:  #{err.message}
        """

      if stdout[..19] is 'mongodb start/running'
        return next()

      else if stdout[..-2] is 'mongodb stop/waiting'
        return next """
        MongoDB does not appear to be running. Try starting it with the
        following command:

          #{c.b}sudo service mongodb start#{c.x}
        """

      else
        return next """
        MongoDB Status returned an unknown response, which may be a problem
        itself. Response:

          #{stdout}
        """

  # Add a "no problems" message if no help has been found, and this command
  # was executed specifically
  steps.push (next) ->
    if userdata.commands[..].pop() is 'mongo'
      next """
      No problems have been identified with MongoDB
      """
    else next()

  # Our little iter function, going through each step
  do iter = (help=null) ->
    step = steps.shift()
    return callback help  if help?
    return step iter      if step?
    callback()

