class AddAuthorIdToOpinion < ActiveRecord::Migration[6.0]
  def change
    add_reference :opinions, :user, null: false, foreign_key: true
  end
end
