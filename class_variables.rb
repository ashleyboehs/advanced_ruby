class ApplicationRecord
  def self.inherited(base)
    @validations ||= {}
    base.instance_variable_set(:@validations, @validations&.dup)
  end

  def self.validates(name, **options)
    @validations[name] = options
  end

  def self.validations
    @validations
  end
end

class User < ApplicationRecord
  validates :name, presence: true
end

class Project < ApplicationRecord
end

class Admin < User
  validates :admin, presence: true
end

p User.validations
p Project.validations
p Admin.validations

p User.validations.object_id
p Admin.validations.object_id
