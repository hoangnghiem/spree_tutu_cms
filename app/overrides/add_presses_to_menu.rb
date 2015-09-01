Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "press_admin_tab",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :partial => "spree/admin/presses/menu",
                     :disabled => false)