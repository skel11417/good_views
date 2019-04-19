module FakeReview
  def fake_review
    rating = rand(1..5)
    if rating >= 3
      text_array = positive
    else
      text_array = negative
    end
    # get sample of sentences and return a paragraph string
    num_sentences = rand(5..10)
    content = text_array.sample(num_sentences).join(' ')
    return {content: content, rating: rating}
  end

  def positive
    ["This is awesome.", "Amazing.", "An Unsurpassed masterpiece.", "It changed my life.", "The acting is so good.", "The cinematography is breathtaking.", "More people should know about this movie.", "One of my favorites ever.", "BEST MOVIE EVER!", "Truly a work of art.", "They don't make them like this anymore.", "Stellar.", "Loved it."]
  end

  def negative
    ["Terrible.", "Hated it.", "WORST. MOVIE. EVER.", "I demand a refund.", "-5 stars.", "I wasted hours of my life watching this movie.", "I am going to end the director of this film.", "I wouldn't make my worst enemy watch this film.", "Like watching paint dry.", "Made me want to gouge my eyes out. So I did."]
  end

end
