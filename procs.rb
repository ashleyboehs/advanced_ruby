def a(&block)
  p block
  x = yield #block.call
end

a {

}

a do
  
end

proc { }
p = Proc.new { |x, y, z| z  }

 lambda { }
l = ->(x) { x * x }

p p.call(1,2,3,4)
p l.call(2)

def proc_method
  x = Proc.new { return "Hello" }
  x.call + " World" 
end

def lambda_method
  x = lambda { return "hello" }
  x.call + " world"
end

p proc_method
p lambda_method

