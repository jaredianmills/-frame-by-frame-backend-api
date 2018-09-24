class RemoveVideoUrlFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :video_url, :string
  end
end
