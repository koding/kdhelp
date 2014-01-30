#
# # Troubleshoot MySQL
#
{exec} = require 'child_process'

module.exports = (callback) ->
  # An array of functions, where each function is a troubleshoot step.
  steps = []

  # Check if mysql is running
  steps.push (next) -> exec 'service mysql status', (err, stdout, stderr) ->
    if err?
      return next """
      There was an error checking the status of mysql. This in itself may be
      a problem. The error message is below:

        Code:     #{err.code}
        Message:  #{err.message}
      """

    if stdout[0...19] is 'mysql start/running'
      return next()

    else if stdout[0...18] is 'mysql stop/waiting'
      return next """
      MySQL does not appear to be running. Try starting it with the following
      command:

        sudo service mysql start
      """

    else
      return next """
      MySQL Status returned an unknown response, which may be a problem itself.
      Response:

        #{stdout}
      """

  # In this command we're simply trying to execute a status message on mysql,
  # with the root user and no pass. If it succeeds, inform the user that
  # they're not using a password. If it errors with access denied, then
  # everything is great. Any other failure is considered "bad".
  steps.push (next) -> exec 'mysql -uroot --execute="status;"', timeout: 1000,
    (err, stdout, stderr) ->
      if stderr[0...33] is 'ERROR 1045 (28000): Access denied'
        return next()

      if err? then return next """
        An error was encountered when communicating with MySQL, which may be an
        issue itself. Error:

          Code:     #{err.code}
          Message:  #{err.message}
        """

      if stderr isnt '' then return next """
        MySQL Status returned an unknown response, which may be a problem
        itself. Response:

          #{stderr}  
        """

      next """
      Your MySQL Root Password has not been set. It should be noted that some
      programs, such as phpMyAdmin, will not function properly with no root
      password set. For help setting your MySQL Root Password, please see
      the following command:

        help mysql
      """


  # Add a "no problems" message if no help has been found, and this command
  # was executed specifically
  steps.push (next) ->
    if userdata.commands[..].pop() is 'mysql'
      next """
      No problems have been identified with MySQL
      """
    else next()

  # Our little iter function, going through each step
  do iter = (help=null) ->
    step = steps.shift()
    return callback help  if help?
    return step iter      if step?
    callback()

