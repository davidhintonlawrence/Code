class Category < ActiveRecord::Base

  has_many :tasks

  # require category name
  validates :name, :presence => true


end
