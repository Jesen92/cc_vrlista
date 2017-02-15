class Project < ActiveRecord::Base
  has_many :jobs
  belongs_to :company
end
