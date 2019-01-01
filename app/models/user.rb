class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, uniqueness: true
  has_many :walks, dependent: :delete_all

  def number_walks
    walks.count
  end

  def duration_walks
    walks.inject(0){ |sum, n| sum + n.duration }
  end

  def number_walks_current_month
    walks.where("date >= ?", Time.now.beginning_of_month).count
  end

  def duration_walks_current_month
    walks.where("date >= ?", Time.now.beginning_of_month).sum(:duration)
  end
end
