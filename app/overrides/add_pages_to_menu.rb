Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "cms_page_admin_tab",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :partial => "spree/admin/cms/menu",
                     :disabled => false)