class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.integer :department_id
      t.string :name
      t.string :title
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end
