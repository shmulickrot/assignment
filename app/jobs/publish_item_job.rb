class PublishItemJob < ApplicationJob
  queue_as :default

  def perform(id)
    ContentItem.find_by_id(id).tap do |c|
      c.status = 'published'
      c.save!
      sleep 2
      puts c
    end
  end
end