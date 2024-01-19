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

class RouteSet
  def initialize
    @routes = {}
  end

  def draw(&block)
    mapper = RouteMapper.new(self)
    mapper.instance_eval(&block)
  end

  def add_route(type, path)
    @routes[path] = { type: type, action: "show" }
  end

  def lookup_action(path)
    @routes[path][:action]
  end
end

class RouteMapper
  def initialize(route_set)
    @route_set = route_set
  end

  def get(name)
    @route_set.add_route("GET", name)
  end

  def post(name)
    @route_set.add_route("POST", name)
  end

  def delete(name)
    @route_set.add_route("DELETE", name)
  end
end

  
class Rails
  def self.configure(&block)
    instance_eval(&block)
  end

  def self.config
    @config ||= Configuration.new(:feature, :whatever)
  end

  def self.routes
    @routes ||= RouteSet.new
  end
end

Rails.configure do
  puts "inside"

  config.feature = true

  config.whatever = false
end

#p Rails.config
#p Rails.config.feature
#p Rails.config

config = Configuration.new(:foo)
config.foo = "hello"
#p config.foo
#p config

Rails.routes.draw do
  get :about
  post :users
  delete :users

  p self
end

p Rails.routes
p Rails.routes.lookup_action(:about)

