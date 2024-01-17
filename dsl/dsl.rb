class Rails
  class Configuration
    def initialize
      @config = {}
    end
    
    def method_missing(name, args)
      @config[name.to_s.gsub(/=/,'')] = args
    end
  end

  def self.configure(&block)
    instance_eval(&block)
  end

  def self.config
    @config ||= Configuration.new
  end
end

Rails.configure do
  puts "inside"

  config.feature = true

  config.whatever = false
end

p Rails.config
