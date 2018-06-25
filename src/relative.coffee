{sep} = require 'path'

parentRE = /^((?:\.\.\/)*\.\.)$/
cousinRE = /^((?:\.\.\/)+)(.+)?$/

# super fast relative path resolver
relative = (file, ref) ->

  # parent
  if ref.length is 1
    dirname file

  # sibling or nephew
  else if ref[1] is sep
    join dirname(file), ref.slice(2)

  # grand-parent
  else if id = parentRE.exec ref
    dirname file, 1 + (id[1].length + 1) / 3

  # cousin or uncle
  else if id = cousinRE.exec ref
    dir = dirname file, 1 + id[1].length / 3
    if dir isnt null
      join dir, id[2]
    else null

  # invalid path
  else null

module.exports = relative

join = (a, b) ->
  b and (a and (a + sep + b) or b) or a

# This assumes `file` never ends with a path separator.
# Returns an empty string if no parent directory exists.
dirname = (file, n) ->

  # Fast path for one directory up.
  if !n or n is 1
    i = file.lastIndexOf sep
    return '' if i is -1

  else
    i = file.length
    while --n isnt -1
      i = file.lastIndexOf sep, i - 1
      if i is -1
        return '' if n is 0
        return null

  if i is 0 then '/'
  else file.slice 0, i

