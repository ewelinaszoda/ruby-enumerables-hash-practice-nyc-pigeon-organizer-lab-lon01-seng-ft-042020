require 'pry'

data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}

def nyc_pigeon_organizer(data)
  pigeon_list = {}
  data.each do |key, values|
    values.each do |value, names_array|
      names_array.each do |name|
        pigeon_list[name] ||= {} 
        pigeon_list[name][key] ||= []
        pigeon_list[name][key] << value.to_s
      end
    end
  end
  pigeon_list
end


=begin 
Ruby's ||= (or equal) operator
Ruby's ||= operator is a handy way to assign variables if they are not defined yet, but not change the variable if they are already defined. ... When a variable is already assigned to a value, the ||= operator will not reassign the value.
=end 

#another solution
=begin
def nyc_pigeon_organizer(data)
  pigeon_list = {}

  data.each do |key, values|
   values.each do |value, names_array|
      names_array.each do |name|
        pigeon_list[name] = {:color => [], :gender => [], :lives => []}  
      end
    end
  end
  data[:color].each do |value, names_array|
    names_array.each do |name|
      if data[:color][value].include?(name)
        pigeon_list[name][:color] << value.to_s
      end
    end
  end
  data[:gender].each do |value, names_array|
    names_array.each do |name|
      if data[:gender][value].include?(name)
        pigeon_list[name][:gender] << value.to_s
      end
    end
  end
  data[:lives].each do |value, names_array|
    names_array.each do |name|
      if data[:lives][value].include?(name)
        pigeon_list[name][:lives] << value
      end
    end
  end
  pigeon_list
end
=end 

def nyc_pigeon_organizer(data)
  new_hash = {}
  data.each do |key, value|
    value.each do |new_value, names|
      names.each do |name|
        
        if !new_hash[name]
          binding.pry
          new_hash[name] = {}
        end

        if !new_hash[name][key]
          new_hash[name][key] = []
        end
        new_hash[name][key] << new_value.to_s

      end
    end
  end
  new_hash
end
