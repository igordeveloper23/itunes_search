class Album < ApplicationRecord
  validates :collection_id, presence: true
end
