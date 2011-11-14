# == Schema Information
#
# Table name: iteration_lists
#
#  id           :integer(4)      not null, primary key
#  iteration_id :integer(4)
#  element_id   :integer(4)
#  avg_score    :float
#  created_at   :datetime
#  updated_at   :datetime
#  include      :boolean(1)
#  new_element  :boolean(1)
#

require 'spec_helper'

describe IterationList do
  pending "add some examples to (or delete) #{__FILE__}"
end
