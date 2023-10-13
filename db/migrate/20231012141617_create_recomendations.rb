class CreateRecomendations < ActiveRecord::Migration[7.0]
  def change
    create_table :recomendations do |t|
      t.references :consultation_request, null: false, foreign_key: true
      t.text :recomendation_text
    end
  end
end
