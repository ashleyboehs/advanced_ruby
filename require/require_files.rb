# $LOAD_PATH.unshift("lib")
p $LOAD_PATH

require_relative "lib/another"

p __FILE__
p __dir__
