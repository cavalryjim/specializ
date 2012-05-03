# config/initializers/kaminari.rb
# JDavis: this is a workaround to fix an issue with will_paginage, kaminari, and activeadmin.
Kaminari.configure do |config|
  config.page_method_name = :per_page_kaminari
end