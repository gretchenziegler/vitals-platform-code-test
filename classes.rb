class Normal

  attr_accessor :expires_in, :quality

  def initialize(expires_in, quality)
    @expires_in = expires_in
    @quality = quality
  end

  def update
    @expires_in -= 1
    self.decrease_quality(1)
    self.decrease_quality(1) if @expires_in <= 0
  end

  def increase_quality(amount)
    @quality = [50, @quality += amount].min
  end

  def decrease_quality(amount)
    @quality = [0, @quality -= amount].max
  end

end

class Distinction < Normal
	
  def update
  end

end

class Star < Normal
	
  def update
    @expires_in -= 1
    if @expires_in <= 0
      self.decrease_quality(4)
    else
      self.decrease_quality(2)
    end
  end

end

class Compare < Normal

  def update
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

end

class First < Normal

  def update
    @expires_in -= 1
    self.increase_quality(1)
    self.increase_quality(1) if @expires_in <= 0
  end

end
