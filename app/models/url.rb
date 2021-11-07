class Url < ApplicationRecord
  validates :short_url, presence: true, length: { maximum: 8 }, uniqueness: true
  validates :long_url, presence: true, uniqueness: true
end
