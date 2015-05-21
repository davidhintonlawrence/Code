class Task < ActiveRecord::Base

  belongs_to :category

  # require description in task
  validates :description, :presence => true

end
