class CreateUserPets < ActiveRecord::Migration[7.0]
  def change
    create_table :user_pets do |t|
      t.references :user, foreign_key: true
      t.references :pet, foreign_key: true
      t.timestamps 
    end
  end
end