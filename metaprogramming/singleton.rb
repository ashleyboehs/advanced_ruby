class User
  def hello
    puts "hello"
  end
end

u = User.new
u.hello

# Eigenclass version = instance copy or subclass of User using << operator 

class << u
  p self

  def hello
    puts "hey"
  end

  def greeting
    puts "Hey, Ash"
  end
end

u.hello
u.greeting

v = User.new
v.hello

class << v
  def goodbye
    puts "goodbye"
  end
end
v.goodbye
