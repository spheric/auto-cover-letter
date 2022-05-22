class AddJobDescriptionToCoverLetter < ActiveRecord::Migration[7.0]
  def change
    add_reference :cover_letters, :job_description, foreign_key: true
  end
end
