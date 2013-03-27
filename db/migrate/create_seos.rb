class CreateSeos < ActiveRecord::Migration
  def change
    create_table :seos do |t|
      t.string :title
      t.text :description
      t.text :keywords
      t.references :promotable, :polymorphic=>true

      t.timestamps
    end
  end
end