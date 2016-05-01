class Month < ActiveRecord::Base
    has_many :articles
    def self.insert
         hash = {"January 2016" => 1, "February 2016" => 2, "March 2016" => 3, "April 2016" => 4, "May 2016" => 5}
        hash.each do |k,v| 
            a = Month.new(name: k, number: v)
            a.save
        end    
    end    
end
