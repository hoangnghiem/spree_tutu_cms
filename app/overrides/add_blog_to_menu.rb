Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "blog_admin_tab",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :partial => "spree/admin/blog/menu",
                     :disabled => false,
                     :original => '8d05a6b687057aa2a8c08b3feb480d58a14fe4aa')