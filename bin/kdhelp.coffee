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
os          = require 'os'
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

  userdata            = getUserdata() # Expose the userdata
  userdata.commands   = commands
  global.userdata     = userdata
  global.utils        =
    print: print

  helper = loadHelp commands
  if helper?
    switch typeof helper
      when 'string' then print helper
      when 'function' then helper (help) -> print help
      else print "Help command failed. Please report this as a bug."
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
  opts.padding  ?= 2
  opts.newLines ?= true

  if opts.padding?
    pad = new Array(opts.padding+1).join ' '
    msg = pad + msg.replace /\n/g, "\n#{pad}"

  log = opts.logFn
  log '' if opts.newLines
  log msg
  log '' if opts.newLines



# ## Suggest
#
# Suggest an alternate command if the threshold is within an acceptable range.
# Currently calculating with levenshtein.
suggest = (commands=[], guilty='', minMatch=1, maxMatch=4) ->
  alt_commands  = fs.readdirSync commands.join path.sep
  match         = null
  matchDistance = maxMatch += 1
  for potential in alt_commands
    # Remove ext
    potential = potential.split('.')[0]
    # Don't suggest the index file lol
    if potential is 'index' then continue

    # Generate our levenshtein
    lev = new Levenshtein(guilty, potential)

    # We already have better match
    if lev.distance > matchDistance then continue

    match = potential
    matchDistance = lev.distance
    # If match is below minMatch then we can return the result and stop
    # trying to find better matches
    if matchDistance <= minMatch then break
  return match



# ## User Data
#
# Evalulate the current context and return varying user data.
getUserdata = ->
  username  = process.env.USER
  hostname  = os.hostname()
  vm        = hostname.split('.')[0]

  # Return the data object
  home        : process.env.HOME
  username    : username
  hostname    : hostname
  vm          : vm
  userDomain  : "#{username}.kd.io"
  vmDomain    : "#{vm}.#{username}.kd.io"



exports.findFault = findFault
exports.loadHelp  = loadHelp
exports.main      = main
exports.print     = print
exports.suggest   = suggest
exports.getUserdata  = getUserdata
if require.main is module then main process.argv
