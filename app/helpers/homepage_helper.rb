module HomepageHelper
  def tweets_info(tweet)
    user = User.find_by(id: tweet.user_id)
    out = []
    if user.photo.attached?

      out << image_tag(user.photo, width: '60%', height:'100%')
      out << user.username
      out << tweet.text
    else
      out << user.username
      out << tweet.text
    end
    out
    tags = html_escape('')
    out.collect { |detail| tags << tag.p(detail, class: 'single-tweet') }
    tags
  end
end
