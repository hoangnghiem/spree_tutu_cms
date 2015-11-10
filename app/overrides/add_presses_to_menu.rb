Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "press_admin_tab",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :partial => "spree/admin/presses/menu",
                     :original => '397b6720d0488f0df90b5285a5bf1a13da269aee',
                     :disabled => false)