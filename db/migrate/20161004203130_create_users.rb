class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |x|
      x.string :username
      x.decimal :balance
      x.string :password
    end
  end
end


