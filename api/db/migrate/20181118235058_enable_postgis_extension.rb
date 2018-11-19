class EnablePostgisExtension < ActiveRecord::Migration[5.2]
  def up
    enable_extension('postgis') unless extensions.include?('postgis')
  end

  def down
    disable_extension('postgis') if extensions.include?('postgis')
  end
end
