class AddMonitoringToDomain < ActiveRecord::Migration[7.1]
  def change
    add_column :domains, :monitoring, :boolean, default: false
  end
end
