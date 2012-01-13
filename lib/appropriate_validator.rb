class AppropriateValidator < ActiveRecord::EachValidator

  def validate_each(record, attribute, value)
    unless ContentModerator.is_suitable?(value)
      record.errors.add( attribute, 'is inappropriate')
    end
  end
  
end
