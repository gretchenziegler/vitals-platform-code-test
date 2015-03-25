class Award

	def initialize(name, expires_in, quality)
		@name = name
		@expires_in = expires_in
		@quality = quality
	end

	attr_accessor :name, :expires_in, :quality

	def normal_award
		@expires_in -= 1
		self.decrease_quality(1)

		self.decrease_quality(1) if @expires_in <= 0
	end

	def blue_distinction_plus_award
		@quality = 80
	end

	def blue_first_award
		@expires_in -= 1
		self.increase_quality(1)

		self.increase_quality(1) if @expires_in <= 0 
	end

	def blue_compare_award
		@expires_in -= 1
    
    if @expires_in < 0
    	@quality = 0 
    elsif @expires_in < 5
    	self.increase_quality(3) 
    elsif @expires_in < 10
      self.increase_quality(2)
    else
      self.increase_quality(1)
    end   
	end

	def blue_star_award
		@expires_in -= 1
		
    if @expires_in <= 0
      self.decrease_quality(4)
    else
      self.decrease_quality(2)
    end
	end

	def increase_quality(amount)
		@quality = [50, @quality += amount].min
	end

	def decrease_quality(amount)
		@quality = [0, @quality -= amount].max
	end

end