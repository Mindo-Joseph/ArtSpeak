module HomepageHelper
  def tweets_info(tweet)
    user = User.find_by(id: tweet.user_id)
    out = []
    out << image_tag(user.photo, width: '60%', height: '100%') if user.photo.attached?
    out << link_to(user.username.to_s, user_path(user.id), class: 'text-left font-weight-bold')
    out << tweet.text
    tags = html_escape('')
    out.collect { |detail| tags << tag.div(detail, class: 'single-tweet') }
    tags
  end
end
