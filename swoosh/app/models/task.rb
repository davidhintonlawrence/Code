class Task < ActiveRecord::Base

  belongs_to :category

  belongs_to :user


  # require description in task
  validates :description, :presence => true

end
