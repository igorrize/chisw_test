class Assignment < ApplicationRecord
  belongs_to :project
  belongs_to :assignee, polymorphic: true

  # after_create :add_employee_total
  # after_destroy :remove_employee_total

  validates :months, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :rnd_percentage, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def total
    self.months.present? && self.rnd_percentage.present? ? ((self.months * self.rnd_percentage) / 12.0) : 0
  end

  def attributes
    super.merge('total' => total)
  end

  def add_employee_total
    # commented code was before we add polymorphic associations
    # self.employee.total += 1
    # self.employee.total.save
    self.assignee.total += 1
    self.assignee.total.save
  end

  def remove_employee_total
    # commented code was before we add polymorphic associations
    # self.employee.total -= 1
    # self.employee.total.save
    self.assignee.total -= 1
    self.assignee.total.save
  end

end
