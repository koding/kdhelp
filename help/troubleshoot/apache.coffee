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
    # Failures from "service" appear to return error codes, but we're ignoring
    # code #3 since we're matching the string manually below. In the future,
    # if we want to match multiple failure types we should handle this
    # properly.
    if err? and err.code isnt 3
      out += """
      There was an error communicating with Apache. This in itself may be a
      problem. The error message is below:

        Code:     #{err.code}
        Message:  #{err.message}
      """
      return done()

    # Check if apache is not running
    if stdout is "Apache2 is NOT running.\n"
      out += """
      Apache does not appear to be running. To start it, try running the
      following command:

        sudo service apache2 start
      """
    else if stdout[0...18] isnt "Apache2 is running"
      out += """
      Apache Responsed with an unknown status, there may be a problem.
      Apache Status: #{JSON.stringify stdout}
      """

    done()

