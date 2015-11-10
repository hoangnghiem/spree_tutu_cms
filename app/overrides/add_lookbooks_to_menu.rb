Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "lookbook_admin_tab",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :partial => "spree/admin/lookbooks/menu",
                     :disabled => false,
                     :original => 'e4b4b6bddd0c7b5f208ef10f109e29f080a2df64')