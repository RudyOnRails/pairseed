class AddAppletHtmlAndViewerUrlToScreenshares < ActiveRecord::Migration
  def change
    add_column :screenshares, :applet_html, :string
    add_column :screenshares, :viewer_url, :string
  end
end
