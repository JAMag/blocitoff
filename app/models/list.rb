class List < ActiveRecord::Base
  has_many :items, dependent: :destroy
  belongs_to :user

  validates :user, presence: true
  validates :title, length: {minimum: 2}
end
