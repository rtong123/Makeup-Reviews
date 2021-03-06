require 'pry'
class User < ApplicationRecord
  has_many :reviews
  has_many :makeups, through: :reviews

  has_secure_password
  validates :username, presence: true, uniqueness: true
  
  scope :top_points, -> {User.order("points DESC")}


  def status_update
    if self.points >= 100
      return "Expert"
    else
      return "Beginner"
    end
  end

  # scope method
  # def self.point_level
  # where(:points > 100)
  # end
  # #display users with 100 points.

end

# routes.rb
# get '/inflencers' "users#define_the_action"
#
# users_controller
# def defined_action
# end
