class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.integer :rank
      t.string :term
      t.integer :domain_id

      t.timestamps
    end
  end
end
