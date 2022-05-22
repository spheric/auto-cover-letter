class CreateJobDescription < ActiveRecord::Migration[7.0]
  def change
    create_table :job_descriptions do |t|
      t.string :job_title
      t.text :company_information
      t.text :duties

      t.timestamps
    end
  end
end
