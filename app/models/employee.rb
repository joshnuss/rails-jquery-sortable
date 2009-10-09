class Employee < ActiveRecord::Base
  acts_as_list :scope => :department_id

  belongs_to :department

  default_scope :order => :position

  validates_presence_of :name, :title
  validates_uniqueness_of :name, :scope => :department_id
end
