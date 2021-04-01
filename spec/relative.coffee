{test} = require 'testpass'

{relative} = require '..'

# relative to 'x/x/x'
cases =
  '.': 'x/x'
  './': 'x/x'
  '..': 'x'
  '../': 'x'
  './y': 'x/x/y'
  './y/': 'x/x/y/'
  '../y': 'x/y'
  '../y/': 'x/y/'
  '../..': ''
  '../../': ''
  '../../..': null
  '../../../': null

Object.keys(cases).forEach (key) ->
  test key, (t) ->
    t.eq relative('x/x/x', key), cases[key]

test 'absolute module', (t) ->
  t.eq relative('/x', '.'), '/'
  t.eq relative('/x', '..'), null
  t.eq relative('/x', '../..'), null
  t.eq relative('/x', './y'), '/y'
  t.eq relative('/x/x', './y'), '/x/y'

