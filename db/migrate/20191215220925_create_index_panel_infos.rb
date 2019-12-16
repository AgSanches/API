class CreateIndexPanelInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :index_panel_infos do |t|
      t.string :title
      t.text :text
      t.integer :type_panel
      t.timestamps
    end
  end
end
