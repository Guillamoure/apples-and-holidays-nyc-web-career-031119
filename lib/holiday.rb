require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  return holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas].push(supply)
  holiday_hash[:winter][:new_years].push(supply)
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day].push(supply)
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
  return holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  christmas_supplies = holiday_hash[:winter][:christmas]
  new_years_supplies = holiday_hash[:winter][:new_years]
  winter_supplies = christmas_supplies.concat(new_years_supplies)
  return winter_supplies.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  
 holiday_hash.each do |season, holiday|
    puts "#{season}:".capitalize
    n = 0
    i = 0
    while i < holiday.keys.length
      
      supplies = holiday.values
      string_holiday = holiday.keys[i].to_s
      array_holiday = string_holiday.split("_")
      array_holiday.each do |word|
        word.capitalize!
      end
      
      i+=1
      string_holiday = array_holiday.join(" ")
      string_supplies = supplies[i-1].join(", ")
      puts "  #{string_holiday}: #{string_supplies}" 
    end
  end
  
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_days = []
  holiday_hash.each do |season, holiday|
    i = 0
    while i < holiday.keys.length
      if holiday.values[i].include?("BBQ")
        bbq_days << holiday.keys[i]
      end
    i+=1
    end
    
  end
  bbq_days
end







