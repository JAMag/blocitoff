class Item < ActiveRecord::Base
  belongs_to :list

  validates :list, presence: true
  #added due to other github

  def days_left
    7 - (DateTime.now.to_date - created_at.to_date).to_i
  end
  
end
