class ContentItem < ApplicationRecord
  enum status: [:draft, :published]
  scope :published, -> {where(:status => 'published')}
  scope :not_published, -> {where.not(:status => 'published')}
end
