require './award'

def update_quality(awards)

  awards.each do |award|
    case award.name
    when "NORMAL ITEM"
      award.normal_award
    when "Blue First"
      award.blue_first_award
    when "Blue Compare"
      award.blue_compare_award
    when "Blue Distinction Plus"
      award.blue_distinction_plus_award
    when "Blue Star"
      award.blue_star_award
    end
  end 

end





