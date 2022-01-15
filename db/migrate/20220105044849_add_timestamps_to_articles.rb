class AddTimestampsToArticles < ActiveRecord::Migration[6.1]

  # Adding columns to our table articles
  def change
    #  fName    tableName   columnName    type
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end

end
