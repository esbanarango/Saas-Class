class Class
	def attr_accessor_with_history(attr_name)
		attr_name = attr_name.to_s # make sure it's a string
		attr_reader attr_name # create the attribute's getter	
		attr_reader attr_name+"_history" # create bar_history getter
		class_eval %Q{
				      def #{attr_name}=(val)
				      	if @#{attr_name}_history.nil?
				      		@#{attr_name}_history = [nil]
				      	end
				        @#{attr_name}_history.push(val)
				        @#{attr_name}=val
				      end
  					}
	end
end

class Foo 
	attr_accessor_with_history :bar
end