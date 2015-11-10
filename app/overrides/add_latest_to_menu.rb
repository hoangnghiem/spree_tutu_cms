Deface::Override.new(:virtual_path => "spree/admin/shared/sub_menu/_product",
                     :name => "latest_admin_tab",
                     :insert_bottom => "[data-hook='admin_product_sub_tabs']",
                     :original => '1950c492f6ee166b7d4eedb6b9076ab3e986f110',
                     :text => '<%= tab :latest_products %>')