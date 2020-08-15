module HomepageHelper
  def tweets_info(tweet)
    user = User.find_by(id: tweet.user_id)
    out = []
    out << image_tag(user.photo, width: '60%', height: '100%') if user.photo.attached?
    out << user.username
    out << tweet.text
    tags = html_escape('')
    out.collect { |detail| tags << tag.p(detail, class: 'single-tweet') }
    tags
  end
end
