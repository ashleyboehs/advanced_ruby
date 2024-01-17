class Path
  %w(autoload_once eager_load autoload load_path).each do |m|
   # Block version
    class_eval do
      define_method :"#{m}!" do
        instance_variable_set :"@#{m}", true
      end

      define_method :"skip#{m}" do
        instance_variable_set :"@#{m}", false
      end

      define_method :"#{m}?" do
        instance_variable_get :"@#{m}"
      end

    end
  end


#  # String version
#     class_eval <<-RUBY, __FILE__, __LINE__ + 1
#        def #{m}!           # def eager_load!
#          @#{m} = true      #   @eager_load = true
#        end                 # end
#
#        def skip_#{m}!      # def skip_eager_load!
#          @#{m} = false     #   @eager_load = false
#        end                 # end
#
#        def #{m}?           # def eager_load?
#          @#{m} = true      #   @eager_load = true
#        end                 # end
#     RUBY
  end
end

p __FILE__
p __LINE__

path = Path.new
path.eager_load!
p path.eager_load?
