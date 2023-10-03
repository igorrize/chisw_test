class AddDefaultTotalToEmployee < ActiveRecord::Migration[7.0]
  def change
    Employee.all.each do |employee|
      employee.total = 0
      employee.save
    end

    change_column :employees, :total, :decimal, precision: 10, scale: 2, default: 0, null: false
  end
end
