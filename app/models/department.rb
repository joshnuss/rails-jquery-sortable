class Department < ActiveRecord::Base
  acts_as_list

  has_many :employees, :dependent => :destroy

  default_scope :order => :position

  validates_presence_of :name
  validates_uniqueness_of :name

  def self.sort(ids)
    transaction do
      ids.each_with_index do |id, index|
        find(id).update_attribute(:position, index+1)
      end
    end
  end
end
