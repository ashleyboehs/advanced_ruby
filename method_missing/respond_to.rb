class User
  attr_reader :attributes

  def initialize
    @attributes = {}
  end

  def method_missing(name, *args, &block)
    if name.end_with?("=")
      @attributes[name.to_s[0..-2].to_sym] = args.first
    else
      @attributes[name]
    end
  end

  def respond_to?(name)
    true
  end
end

user = User.new
p user.respond_to?(:email)
p user.respond_to?(:email=)
p user.respond_to?(:upcase)
