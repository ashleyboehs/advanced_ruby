TASKS = {}

def task(name, &block)
  TASKS[name.to_s] = block
end

load "./Rakefile"

ARGV.each do |name|
  if TASKS.has_key?(name)
    TASKS[name].call
  else
    puts "No task with name #{name} defined."
  end
end
