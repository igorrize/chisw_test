require 'test_helper'

class Api::V1::AssignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    employee = Employee.create(name: 'employee_one', salary: 100)
    project = Project.create(name: 'project_one')
    @assignment = Assignment.new(
      months: 6,
      rnd_percentage: 50,
      total: 25.0,
      assignee_type: 'Employee',
      assignee_id: employee.id,
      project_id: project.id
    )
    @assignment.save
  end

  test "should get index" do
    get api_v1_assignments_url, as: :json
    assert_response :success
  end

  test "should show assignment" do
    get api_v1_assignment_url(@assignment), as: :json
    assert_response :success
  end

  test "should create assignment" do
    assert_difference('Assignment.count') do
      post api_v1_assignments_url, params: { assignment: { months: 6, rnd_percentage: 50, project_id: 1, assignee_type: 'Employee', assignee_id: 1 } }, as: :json
    end

    assert_response :created
  end

  test "should update assignment" do
    patch api_v1_assignment_url(@assignment), params: { assignment: { months: 12 } }, as: :json
    assert_response :success
  end
end
