tag_ids = Tag.pluck(:id)

(2..59).each do |cafe_id|
  tags_to_add = tag_ids.sample(rand(2..4))
  
  tags_to_add.each do |tag_id|
    Tagging.create!(
      tag_id: tag_id,
      taggable_type: 'Cafe',
      taggable_id: cafe_id,
      context: 'tags'
    )
  end
end
