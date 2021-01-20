class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body

      t.timestamps

      t.references :imageable, polymorphic: true
    end
  end
end
