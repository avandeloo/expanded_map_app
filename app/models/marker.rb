class Marker < ApplicationRecord
  enum marker_role: { origin: 0, work: 1, home: 2 }
  has_many :routes_that_end_here, class_name: "Route", foreign_key: "work_id"
  has_many :routes, class_name: "Route", foreign_key: "origin_id"
  belongs_to :user


  # def address_line1_format(address)
  #   self.address_line1_format = 
  # end

  # def address_line2_format()
    
  # end
  
end
