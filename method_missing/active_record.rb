require "pg"

module ActiveRecord
  class Base
    def self.table_name
      "#{name.downcase}s"
    end

    def self.columns
     @columns ||= connection.exec("SELECT column_name, data_type FROM information_schema.columns WHERE table_name='#{table_name}'").to_a
    end

    def self.connection
      @connection ||= PG.connect( dbname: "nps_test")
    end
    
    def self.inherited(base)
      base.class_eval do
        columns.each do |column|
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

    def initialize
      @attributes = {}
    end
   end 
end

class User < ActiveRecord::Base
end

class Project < ActiveRecord::Base
end

project = Project.new
projct.title = "test"
p project.title

p User.table_name.downcase
p User.columns

