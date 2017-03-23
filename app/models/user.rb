class User < ApplicationRecord
  has_many :train_lines
  has_many :markers
  has_many :routes, through: :markers

  has_secure_password

  def current_route
    self.routes.last
  end

  def current_origin
    self.markers.where(marker_role: 0).last
  end

end
