require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase
  fixtures :employees, :contractors, :projects, :assignments

  test "valid assignment with employee" do
    employee = Employee.create(name: 'employee_one', salary: 100)
    project = Project.create(name: 'project_one')
    assignment = Assignment.new(
      months: 6,
      rnd_percentage: 50,
      total: 25.0,
      assignee_type: 'Employee',
      assignee_id: employee.id,
      project_id: project.id
    )
    assert assignment.valid?
  end

  test "valid assignment with contractor" do
    contractor = Contractor.create(name: 'contractor_one', salary: 100)
    project = Project.create(name: 'project_two')

    assignment = Assignment.new(
      months: 6,
      rnd_percentage: 50,
      total: 25.0,
      assignee_type: 'Contractor',
      assignee_id: contractor.id,
      project_id: project.id
    )
    assert assignment.valid?
  end
end
