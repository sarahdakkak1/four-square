class Business < ApplicationRecord
  has_many :reviews
  has_many_attached :photos


  before_create :slugify
  def slugify
      self.slug = name.parameterize
  end

  def avg_score
      return 0 unless reviews.count.positive?
      reviews.average(:score).round(2).to_f
  end

  searchkick
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
