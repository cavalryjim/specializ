# config/initializers/will_paginate.rb
# JDavis: this is a workaround to fix an issue with will_paginage, kaminari, and activeadmin.
if defined?(WillPaginate)
  module WillPaginate
    module ActiveRecord
      module RelationMethods
        alias_method :per, :per_page
        alias_method :num_pages, :total_pages
        alias_method :total_count, :count
      end
    end
  end
end