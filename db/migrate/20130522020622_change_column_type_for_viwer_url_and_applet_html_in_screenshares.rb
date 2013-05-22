class ChangeColumnTypeForViwerUrlAndAppletHtmlInScreenshares < ActiveRecord::Migration
  def change
    change_column :screenshares, :viewer_url, :text
    change_column :screenshares, :applet_html, :text
  end
end
