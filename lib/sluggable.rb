require 'active_support/concern'

module Sluggable
  extend ActiveSupport::Concern

  included do
    before_save :generate_slug!
  end

  def to_param
    self.slug
  end

  def to_slug(name)
    str = name.strip
    str.gsub!(" ", "-")
    str.downcase
  end

  def generate_slug!
    self.slug = to_slug(self.name)
    self.slug.downcase!
  end
end
