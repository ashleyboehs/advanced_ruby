class User
  @@attributes = [:id, :email, :name]

  @@attributes.each do |name|
    define_method(name) do
      @attributes[name]
    end

    define_method(:"#{name}=") do |value|
      @attributes[name] = value
    end
  end

  def initialize
    @attributes = {}
  end
end

user = User.new
user.id = 1
user.email = "test@test.com"
p user.id
p user.email
p user.name
