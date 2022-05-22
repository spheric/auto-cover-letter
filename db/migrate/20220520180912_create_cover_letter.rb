class CreateCoverLetter < ActiveRecord::Migration[7.0]
  def change
    create_table :cover_letters do |t|
      t.text :content

      t.timestamps
    end
  end
end
