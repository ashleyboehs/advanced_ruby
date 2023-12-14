class Object
  def self.const_missing(name)
    @looked_for ||= {}
    str_name = name.to_s

    raise "Class not found: #{name}" if @looked_for[str_name]

    @looked_for[str_name] = 1
    file = "./concerns/#{name.to_s.downcase}"
    require file
    klass = const_get(name)
    return klass if klass

    raise "Class not found: #{name} in #{file}"
  end
end

class Module 
  def const_missing(name)
    @looked_for ||= {}
    str_name = name.to_s

    raise "Class not found: #{name}" if @looked_for[str_name]

    @looked_for[str_name] = 1
    file = "./concerns/#{name.to_s.downcase}"
    require file
    klass = const_get(name)
    return klass if klass

    raise "Class not found: #{name} in #{file}"
  end
end
  
Authentication
Authentication

module User
  p Module.nesting
  #login
end
