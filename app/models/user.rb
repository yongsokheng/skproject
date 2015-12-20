class User < ActiveRecord::Base
  include RailsAdminUser
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :songs

  validates :username, presence: true

  def name
    username
  end
end
