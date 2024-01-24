TASKS = {}

class Task
  def initialize(name, dependencies, block)
    @name = name
    @dependencies = dependencies
    @block = block
  end

  def call
    return if @already_run

    @dependencies.each do |dep|
      TASKS[dep.to_s].call
    end

    @block.call
    @already_run = true
  end
end

def task(name, dependencies: [], &block)
  TASKS[name.to_s] = Task.new(name, dependencies, block)
end

load "./Rakefile"

ARGV.each do |name|
  if TASKS.has_key?(name)
    TASKS[name].call
  else
    puts "No task with name #{name} defined."
  end
end
