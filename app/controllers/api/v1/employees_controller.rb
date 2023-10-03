class Api::V1::EmployeesController < ApplicationController
  def show
    employee = Employee.find(params[:id])
    render json: employee
  end

  def index
    employees = Employee.all
    render json: employees
  end
end
