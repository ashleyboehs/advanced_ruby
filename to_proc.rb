def a(x, y, z &block)
  p block
end

a do
  
end

["a", "b", "c"].map{ |obj| obj.upcase }
["a","b", "c"].map(&:upcase)
["a","b", "c"].map(&:upcase.to_proc)
["a","b", "c"].map(&->(obj, args=nil) {obj.send(:upcase, *args)})



class Symbol
  def to_proc
    ->(obj, args=nil) { obj.send(self, *args)}
  end
end

class Formula
  def self.to_proc
    ->(obj) { obj * obj }
  end
end

[1,2,3,4].map(&Formula)
