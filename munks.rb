require 'pathname'

def common_path(paths)
  paths.map { |path| path.ascend.to_a }.reduce(&:&)&.first
end

p common_path([
  Pathname("/usr/bin/ruby"),
  Pathname("/usr/bin/python"),
  Pathname("/usr/bin/php")
])

