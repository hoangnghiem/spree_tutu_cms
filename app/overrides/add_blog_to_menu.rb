Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "blog_admin_tab",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :partial => "spree/admin/blog/menu",
                     :disabled => false)