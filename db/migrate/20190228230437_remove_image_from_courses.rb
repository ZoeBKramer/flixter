class RemoveImageFromCourses < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :image, :string
  end
end
