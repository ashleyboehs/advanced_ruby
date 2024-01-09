class User
  attr_reader :attributes, :allowed

  def initialize
    @allowed = [:id, :email, :name]
    @attributes = {}
  end

  def method_missing(name, *args, &block)
    if !respond_to_missing?(name)
      super
    elsif name.end_with?("=")
      @attributes[name.to_s[0..-2].to_sym] = args.first
    else
      @attributes[name]
    end
  end

  def respond_to_missing?(name, *)
    name = (name.to_s.gsub("=", " ").to_sym)
    allowed.include?(name)
  end
end

user = User.new
p user.respond_to?(:email)
p user.respond_to?(:email=)
p user.respond_to?(:upcase)

p user.method(:email)
p user.method(:email=)
p user.method(:upcase)
