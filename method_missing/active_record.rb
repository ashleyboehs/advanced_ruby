require "pg"

module ActiveRecord
  class Base
    def self.table_name
      "#{name.downcase}s"
    end

    def self.columns
      @columns ||= begin
                        results = connection.exec("SELECT column_name, data_type FROM information_schema.columns WHERE table_name='#{table_name}'").to_a
                        Hash[results.map{ |row| row.values_at("column_name", "data_type")}].transform_keys(&:to_sym)
      end
    end

    def self.connection
      @connection ||= PG.connect( dbname: "nps_test")
    end
    
    def self.inherited(base)
      base.class_eval do
        columns.each do |name, type|
          name = column["column_name"]
          define_method(name) do
            @attributes[name]
          end

          define_method("#{name}=") do |value|
            @attributes[name] = value
          end
        end
      end
    end

    def initialize(attributes=nil)
      @attributes = attributes.slice(*self.class.columns.keys)
    end
   end 
end

class User < ActiveRecord::Base
end

class Project < ActiveRecord::Base
end

p User.columns
p Project.columns
p User.new(name: "Ashley", email: "ashley@boehs.com")
p user.name
p user.email
