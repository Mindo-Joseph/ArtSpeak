module UsersHelper
  def renderCoverImage(user)
    image_tag(user.coverImage, class: 'w-100 h-50 border-bottom pb-2 pr-0') if user.coverImage.attached?
  end

  def renderPhoto(user)
    image_tag(user.photo, width: '15%', class: 'rounded-circle ') if user.photo.attached?
  end

  def relationship_action(user)
    ids = user.followers.pluck(:id)
    if user == current_user
      link_to 'Edit Profile', edit_user_path(user.id)
    elsif ids.include?(current_user.id)
      link_to 'Unfollow', unfollow_user_path, method: 'post'
    else
      link_to 'Follow', follow_user_path, method: 'post'
    end
  end

  def followers_count(user)
    user.followers.count
  end

  def following_count(user)
    user.followings.count
  end

  def tweets_count(user)
    user.opinions.count
  end

  def who_to_follow(user)
    html = ''
    if following_count(user) == 0
      all_users
    else
      ids = user.followings.pluck(:id)
      User.where.not(id: ids).limit(3).sort.reverse.each do |person|
        name = "#{person.fullname} \n"
        html << image_tag(person.photo, width: '20%') if person.photo.attached?
        html << simple_format(name)
        html << (link_to 'Follow', follow_user_path(person.id), method: 'post') unless current_user.followings.pluck(:id).include?(person.id)
      end
    end
    html.html_safe
  end

  def all_users
    html = ''
    User.all.sort.reverse.each do |user|
      name = "#{user.fullname} \n"
      html << image_tag(user.photo, width: '30%') if user.photo.attached?
      html << simple_format(name)
      html << (link_to 'Unfollow', unfollow_user_path(user.id), method: 'post') if current_user.followings.pluck(:id).include?(user.id)
      html << (link_to 'Follow', follow_user_path(user.id), method: 'post') unless current_user.followings.pluck(:id).include?(user.id)
    end
    html.html_safe
  end
  def followed_accounts(user)
    html = ''
    user.followers.limit(3).each do |follower|
      name = "#{user.fullname} \n"
      html << image_tag(user.photo, width: '20%') if user.photo.attached?
      html << simple_format(name)
    end
    html.html_safe
  end
end
