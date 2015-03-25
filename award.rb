class Award

	attr_accessor :item, :name

	def initialize(name, expires_in, quality)

		case name
    when "NORMAL ITEM"
      @item = Normal.new(expires_in, quality)
    when "Blue First"
      @item = First.new(expires_in, quality)
    when "Blue Compare"
      @item = Compare.new(expires_in, quality)
    when "Blue Distinction Plus"
      @item = Distinction.new(expires_in, quality)
    when "Blue Star"
      @item = Star.new(expires_in, quality)
    end

    @name = name

	end

	def update_award
		item.update
	end

	def expires_in
		item.expires_in
	end

	def quality
		item.quality
	end

end