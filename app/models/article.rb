class Article < ApplicationRecord
  has_many_attached :images

  paginates_per 3

  default_scope { order(publish_date: :desc) }

  validates :header_image_html, :title, :publish_date, :content_html, presence: true

  CLIMBING = "climbing".freeze
  SOFTWARE = "software".freeze
  CATEGORIES = [CLIMBING, SOFTWARE].freeze

  def self.ransackable_attributes(auth_object = nil)
    %w[category content_html created_at header_image_html id publish_date slug title updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[images_attachments images_blobs]
  end
end
