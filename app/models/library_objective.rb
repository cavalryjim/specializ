# == Schema Information
#
# Table name: library_objectives
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  number      :string(255)
#  description :text
#  library_id  :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

class LibraryObjective < ActiveRecord::Base
  belongs_to :library
  
  
end
