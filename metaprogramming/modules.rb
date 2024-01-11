module Concern
  def included(base=nil, &block)
    @_include_block = block
  end 

  def append_features(base)
    super
    base.extend const_get(:ClassMethods) if const_defined?(:ClassMethods)
    base.class_eval(&@_include_block) if instance_variable_defined?(:@_include_block)
  end 

  def class_methods(&block)
    mod = const_defined?(:ClassMethods, false) ? const_get(:ClassMethods) : const_set(:ClassMethods, Module.new)
    mod.module_eval(&block)
  end 
end

module Active
  extend Concern

  included do
    attr_accessor :email
  end

  class_methods do
  def active
    []
  end 
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
p User.new.email
