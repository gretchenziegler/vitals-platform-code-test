require './award'

def update_quality(awards)
  awards.each do |award|

    # decrease days to expiration by one for all awards, no matter the type
    award.expires_in -= 1

    case award.name
      # BF awards increase in quality the older they get, but cannot have a quality greater than 50
      when "Blue First"
        if award.quality < 49 && award.expires_in <= 0
          award.quality += 2
        elsif award.quality < 50
          award.quality += 1
        end

      # BDP awards never decrease in quality; they are always at 80
      # According to the tests, they also never expire
      when "Blue Distinction Plus"
        award.expires_in += 1
        award.quality = 80

      # BC awards increase as the expiration date approaches; +2 at 10 or fewer days, +3 at 5 or fewer days, 0 quality after it has expired; quality cannot get above 50
      when "Blue Compare"
        if award.expires_in < 0
          award.quality = 0
        elsif award.quality < 48 && award.expires_in < 5
          award.quality += 3
        elsif award.quality < 49 && award.expires_in < 10
          award.quality += 2
        elsif award.quality < 50
          award.quality += 1
        end

      # BS awards lose quality twice as fast as any other award
      when "Blue Star"
        if award.expires_in <= 0 && award.quality > 3
          award.quality -= 4
        elsif award.quality > 1
          award.quality -= 2
        elsif award.quality == 1
          award.quality -= 1
        else
          award.quality = 0
        end

      # other awards decrease by one point a day until they have expired (and then they degrade twice as fast, but don't go below 0) 
      else
        if award.expires_in > 0 && award.quality > 0
          award.quality -= 1
        else
          if award.quality > 1
            award.quality -= 2
          elsif award.quality == 1
            award.quality -= 1
          else
            award.quality = 0
          end
        end
        
    end
  end
end


