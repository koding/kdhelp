# 
# # KDHelp Bin
#
# This bin is responsible for printing the help and figuring out what commands
# this help has. The actual "help" documentation can be found in `../help`,
# and see `../help/index.coffee` for documentation on how to contribute help
# to this bin.
#
# Note that this design is a bit complex for simple help printing, but the goal
# of this is to ensure that contribution to the documentation requires almost
# no knowledge of how this was implemented. Again, see `../help/index.coffee`
# for additional understanding of this point.
#
fs          = require 'fs'
path        = require 'path'
Levenshtein = require 'levenshtein'




# ## Find Fault
#
# Given a list of "bad commands", this will find the first offending command
# and return it.
#
# The goal of this is that if a user supplies *(fake example)*
# `help mtsql connect` then telling the user that `connect` is an invalid
# command may be incorrect.. `connect` may be entirely true, but there is
# a typo with the `mtsql` command.
#
# Also, by finding the first faulty command, we can list alternatives.
findFault = (commands=[]) ->
  guilty = commands.pop()
  try
    require.resolve commands.join path.sep
  catch e
    return findFault commands
  [guilty, suggest commands, guilty]



# ## Load Help
#
# Given a list of commands, this function will load the command from the help
# directory and return it. `null` is returned if there is any trouble finding
# the command.
loadHelp = (commands=[]) ->
  try
    return require commands.join path.sep
  catch e
    return null


# ## Main
#
# Called when this file is executed directly.
main = (argv) ->
  # Removing the first two args for the time being, temporary for dev
  commands = [__dirname, '..', 'help'].concat argv[2...]

  help = loadHelp commands
  if help?
    print help
  else
    [fault, recommend] = findFault commands
    print "'#{fault}' is not a recognized command"
    if recommend? then print "Did you mean '#{recommend}'?"



# ## Print
#
# A simple pretty print function, allowing us to add padding and whatever else
# might be pleasing to the user.
print = (msg='', opts={}) ->
  opts.logFn    ?= console.error
  opts.padding  ?= 4

  if opts.padding?
    pad = new Array(opts.padding+1).join ' '
    msg = pad + msg.replace '\n', "\n#{pad}"

  log = opts.logFn
  log ''
  log msg
  log ''



# ## Suggest
#
# Suggest an alternate command if the threshold is within an acceptable range.
# Currently calculating with levenshtein.
suggest = (commands=[], guilty='', threshold=3) ->
  alt_commands  = fs.readdirSync commands.join path.sep
  for potential in alt_commands
    potential = potential.split('.')[0] # Remove ext
    if potential is 'index' then continue # Don't suggest the index file lol
    if new Levenshtein(guilty, potential).distance <= threshold
      return potential
  return null



exports.findFault = findFault
exports.loadHelp  = loadHelp
exports.main      = main
exports.print     = print
exports.suggest   = suggest
if require.main is module then main process.argv
