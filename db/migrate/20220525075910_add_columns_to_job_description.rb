class AddColumnsToJobDescription < ActiveRecord::Migration[7.0]
  def change
    add_column :job_descriptions, :experience, :string
    add_column :job_descriptions, :skills, :text
    add_column :job_descriptions, :company_name, :string
  end
end
