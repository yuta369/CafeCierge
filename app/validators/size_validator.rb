class SizeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, :invalid, message: "is too big") if value.attached? && value.blob.byte_size > options[:less_than]
  end
end
