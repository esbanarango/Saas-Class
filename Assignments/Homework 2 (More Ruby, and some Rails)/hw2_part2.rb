class CartesianProduct
	attr_accessor :cartesian
	include Enumerable

    def each
        @cartesian.each{|item| yield item}
    end

  	def initialize(arr1,arr2)
  		@cartesian = []
  		unless (arr1.size < 1 && arr2.size < 1)
  			arr1.each do |i|
  				arr2.each do |j| 
  					cartesian.push([i,j])
  				end
  			end
  		end
  	end
end