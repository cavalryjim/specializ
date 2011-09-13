class IterationList < ActiveRecord::Base
  belongs_to :iteration
  belongs_to :element
  
end
