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

require 'spec_helper'

describe LibraryObjective do
  pending "add some examples to (or delete) #{__FILE__}"
end
