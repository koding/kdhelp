#
# # Troubleshoot Apache
#
{exec} = require 'child_process'

module.exports = (cb) ->
  out = ''

  done = ->
    # Check if their asking for this help specifically.
    if userdata.commands[..].pop() is 'apache' and out is ''
      out = """
      No problems have been identified with Apache
      """
    cb out

  # Ask the apache2 service for a status.
  exec 'service apache2 status', (err, stdout, stderr) ->
    if err?
      out += """
      There was an error communicating with Apache. This in itself may be a
      problem. The error message is below:

        #{err.message}
      """
      return done()

    # Check if apache is not running
    if stdout is "Apache2 is NOT running.\n"
      out += """
      Apache does not appear to be running
      """
    else if stdout[0...18] is "Apache2 is running"
      out += """
      Apache Responsed with an unknown status, there may be a problem.
      Apache Status: "#{stdout}"
      """

    done()
