class RemoveContentFromCoverLetters < ActiveRecord::Migration[7.0]
  def change
    remove_column :cover_letters, :content, :text
  end
end
