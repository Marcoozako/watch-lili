require 'json'
require 'open-uri'

class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true, uniqueness: true

  url = "https://tmdb.lewagon.com/movie/top_rated"
  user_ser = URI.open(url).read
  user = JSON.parse(user_ser)
end
