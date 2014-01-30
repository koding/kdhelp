# 
# # Troubleshoot All
#
module.exports = (cb) ->
  troubleshooterPaths = [
    './apache'
    './ftp'
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
      out += "\n#{ts}"
      return iter()
    ts (help) ->
      if help?
        help  += '\n'         if help[-1..] isnt '\n'
        out   += "\n\n#{help}"
      iter()
