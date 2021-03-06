class Movie < ApplicationRecord
  include FakeReview
  has_many :reviews
  has_many :users, through: :reviews

  def self.create_from_omdb(response)
    r = response.parsed_response
    m = Movie.create(
      title: r["Title"],
      year: r["Year"],
      rated: r["Rated"],
      director: r["Director"],
      poster: r["Poster"],
      actors: r["Actors"],
      plot: r["Plot"],
      imdb_id: r["imdbID"]
    )
    return m
  end

  def average_rating
    if self.reviews.length > 0
      all_reviews = self.reviews.map {|review| review.rating}
      return all_reviews.inject{ |sum, el| sum + el }.to_f / all_reviews.size
    else
      return false
    end
  end

  def auto_review
    user = User.all.sample
    fake_review = self.fake_review
    content = fake_review[:content]
    rating = fake_review[:rating]
    r = Review.create(user_id: user.id, movie_id: self.id, content: content, rating: rating)
  end
end
