class ApplicationRecord
  @validations = {}
  
  def self.validations(name, **options)
    @validations[name] = options
  end

  def self.validations
    @validations
  end

end

class User < ApplicationRecord
  @validations = {}
  validations :name, presence: true
end

class Project < ApplicationRecord
  @validations = {}
end

p ApplicationRecord.validations
p User.validations
p Project.validations

