# frozen_string_literal: true

# This migration comes from acts_as_taggable_on_engine (originally 2)

class AddMissingUniqueIndices < ActiveRecord::Migration[6.0]
  def self.up
  end

  def self.down
    remove_index ActsAsTaggableOn.tags_table, :name

    remove_index ActsAsTaggableOn.taggings_table, name: 'taggings_idx'

    add_index ActsAsTaggableOn.taggings_table, :tag_id unless index_exists?(ActsAsTaggableOn.taggings_table, :tag_id)
    add_index ActsAsTaggableOn.taggings_table, %i[taggable_id taggable_type context],
              name: 'taggings_taggable_context_idx'
  end
end
