class Person
  def self.speak
    p "class speak"
  end

  def speak
    p "instance speak"
  end
end

Person.speak
Person.new.speak

binding.irb
