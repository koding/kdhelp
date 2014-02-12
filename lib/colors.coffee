#
# # Colors
#
# A simple color object to color text in help.
#
# ## Usage
#
# Import this colors library with `colors = require './rel/to/lib/colors'`. After
# that, simply use the colors found within the object, and clear it with the clear
# color. Example:
#
# ```CoffeeScript
# colors = require '../lib/colors'
# module.exports = """
# Here is #{colors.blue}blue text#{colors.clear}
# """
# ```
#
rawColors =
  blue:     '\x1B[34m'
  clear:    '\x1B[39m'
  cyan:     '\x1B[36m'
  green:    '\x1B[32m'
  magenta:  '\x1B[35m'
  red:      '\x1B[31m'
  yellow:   '\x1B[33m'
  


shortColors =
  x:  rawColors.clear
  c:  rawColors.cyan
  b:  rawColors.blue
  r:  rawColors.red
  g:  rawColors.green
  y:  rawColors.yellow
  m:  rawColors.magenta



# ## colorTable()
#
# A little function that attempts to split a string into columns and color code
# each column.
colorTable = (source='', opts={}, userColors...) ->
  if typeof opts is 'string'
    userColors.unshift opts
    opts = {}

  opts.undefinedColor = rawColors.clear
  opts.closingColor   = rawColors.clear

  result = ''
  for line in source.split '\n'
    columnColors = userColors[..]
    # Split the string on any large grouping of spaces, which are assumed to be
    # used for padding columns.
    for column in line.split /(\s{2,})/
      # If the column is one of the string paddings, add it to the result and
      # skip this column
      if /\S/.test(column) is false
        result += column
        continue
      color = columnColors.shift() ? opts.undefinedColor
      result += color + column
    result += '\n'
  result += opts.closingColor




exports.c           = shortColors
exports.colorTable  = colorTable
exports.colors      = rawColors
exports.shortColors = shortColors
