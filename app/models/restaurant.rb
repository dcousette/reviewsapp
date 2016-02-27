class Restaurant < ActiveRecord::Base
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  belongs_to :category
  has_many :reviews
  validates_uniqueness_of :name, :description
  validates_presence_of :name, :description, :category_id
  validates :slug, presence: true, uniqueness: true
end
