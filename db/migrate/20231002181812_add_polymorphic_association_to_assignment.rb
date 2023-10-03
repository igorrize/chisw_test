class AddPolymorphicAssociationToAssignment < ActiveRecord::Migration[7.0]
  def change
    add_reference :assignments, :assignee, polymorphic: true, index: true

    Assignment.all.each do |assignment|
      assignment.update(assignee: assignment.employee)
    end

    remove_reference :assignments, :employee
  end
end
