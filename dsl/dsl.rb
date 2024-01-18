class Configuration
   def initialize(*attributes)      
     @config = {}
    
      attributes.each do |attribute|
        define_singleton_method attribute do
          @config[attribute]
        end
      # ;"#{}" turns the symbol into a string and converts it back to a symbol
        define_singleton_method :"#{attribute}=" do |value|
          @config[attribute] = value
        end
      end
   end
end

class Rails
  def self.configure(&block)
    instance_eval(&block)
  end

  def self.config
    @config ||= Configuration.new(:feature, :whatever)
  end
end

Rails.configure do
  puts "inside"

  config.feature = true

  config.whatever = false
end

p Rails.config
p Rails.config.feature
p Rails.config

config = Configuration.new(:foo)
config.foo = "hello"
p config.foo
p config
