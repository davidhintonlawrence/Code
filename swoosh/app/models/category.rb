class Category < ActiveRecord::Base

  has_many :tasks

  belongs_to :user


  # require category name
  validates :name, :presence => true


end
