Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "cms_page_admin_tab",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :partial => "spree/admin/cms/menu",
                     :original => '731cd1c62dbc97df0502df7d57ea40130a8b775f',
                     :disabled => false)