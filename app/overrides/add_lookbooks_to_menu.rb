Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "lookbook_admin_tab",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :partial => "spree/admin/lookbooks/menu",
                     :disabled => false)