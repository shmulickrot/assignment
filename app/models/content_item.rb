class ContentItem < ApplicationRecord
  enum status: [:draft, :published]
  scope :published, -> {where(:status => 'published')}

end
