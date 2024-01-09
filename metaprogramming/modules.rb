module Active
  def self.included(base)
    base.extend(ClassMethods)
  end

module ClassMethods
  def active
    []
  end 
end 

  def self.extended(base)
    p base
  end

  def active?
    true
  end
end

class User
  include Active
end

class Project
  extend Active
end 

p User.active
p User.new.active?
