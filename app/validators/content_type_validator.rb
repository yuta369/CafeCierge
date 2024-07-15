class ContentTypeValidator < ActiveModel::EachValidator
  ALLOWED_CONTENT_TYPES = ['image/png', 'image/jpg', 'image/jpeg']

  def validate_each(record, attribute, value)
    record.errors.add(attribute, :invalid, message: "must be a PNG or JPG") if value.attached? && !ALLOWED_CONTENT_TYPES.include?(value.blob.content_type)
  end
end
