class Award

	def initialize(name, expires_in, quality)
		@name = name
		@expires_in = expires_in
		@quality = quality
	end

	attr_accessor :name, :expires_in, :quality

	def normal_award
		@expires_in -= 1
		if @quality > 0
			@quality -= 1
		end
		if @quality > 0 && @expires_in <= 0
			@quality -=1
		end
	end

	def blue_distinction_plus_award
		@quality = 80
	end

	def blue_first_award
		@expires_in -= 1
		if @expires_in <= 0 && @quality < 49
			@quality += 2
		elsif @quality < 50
			@quality += 1
		end
	end

	def blue_compare_award
		@expires_in -= 1
    if @expires_in < 0
      @quality = 0
    elsif @quality < 48 && @expires_in < 5
      @quality += 3
    elsif @quality < 49 && @expires_in < 10
      @quality += 2
    elsif @quality < 50
      @quality += 1
    end
	end

	def blue_star_award
		@expires_in -= 1
    if @expires_in <= 0 && @quality > 3
      @quality -= 4
    elsif @quality > 1
      @quality -= 2
    elsif @quality == 1
      @quality -= 1
    else
      @quality = 0
    end
	end

end