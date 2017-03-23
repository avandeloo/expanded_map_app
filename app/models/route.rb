class Route < ApplicationRecord
  enum status: { en_route: 0, arrived: 1, returning: 2, completed: 3 }
  belongs_to :origin, class_name: "Marker"
  belongs_to :work, class_name: "Marker"


end
