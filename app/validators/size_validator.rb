class SizeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.attached? && value.blob.byte_size > options[:less_than]
      record.errors.add(attribute, :invalid, message: "is too big")
    end
  end
end