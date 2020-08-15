module UsersHelper
  def renderCoverImage(user)
    image_tag(user.coverImage, class: 'w-100 h-50 border-bottom pb-2 pr-0') if user.coverImage.attached?
  end

  def renderPhoto(user)
    image_tag(user.photo, width: '25%', height: '25%') if user.photo.attached?
  end

  def renderPhotoAside(user)
    image_tag(user.photo, width: '60%', height: '60%') if user.photo.attached?
  end

  def relationship_action(user)
    ids = user.followers.pluck(:id)
    if user == current_user
      link_to 'Edit Profile', edit_user_path(user.id), class: 'btn btn-primary w-50 m-2'
    elsif ids.include?(current_user.id)
      link_to 'Unfollow', unfollow_user_path, class: 'btn btn-primary w-50 m-2', method: 'post'
    else
      link_to 'Follow', follow_user_path, class: 'btn btn-primary w-50 m-2', method: 'post'
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
      return all_users(user)
    else
      ids = user.followings.pluck(:id)
      ids << current_user.id
      User.where.not(id: ids).order(created_at: :desc).limit(3).each do |person|
        name = "#{person.fullname} \n"
        html << image_tag(person.photo, width: '20%') if person.photo.attached?
        html << simple_format(name)
        html << (link_to 'Follow', follow_user_path(person.id), class: 'btn btn-primary btn-md', style: 'width:100px', method: 'post')
        html << (link_to 'View', user_path(person.id), class: 'btn btn-primary btn-md', style: 'width:100px')
      end
    end

    html.html_safe
  end

  def all_users(user)
    html = ''
    User.where.not(id: user.id).order(created_at: :desc).each do |user|
      name = "#{user.fullname} \n"
      html << image_tag(user.photo, width: '150px', height: '150px') if user.photo.attached?
      html << simple_format(name)
      if current_user.followings.pluck(:id).include?(user.id)
        html << (link_to 'Unfollow', unfollow_user_path(user.id), class: 'btn btn-danger', method: 'post')
        html << (link_to 'View', user_path(user.id), class: 'btn btn-primary btn-md')
      end
      unless current_user.followings.pluck(:id).include?(user.id)
        html << (link_to 'Follow', follow_user_path(user.id), class: 'btn btn-primary ', method: 'post')
        html << (link_to 'View', user_path(user.id), class: 'btn btn-primary btn-md')
      end
    end
    html.html_safe
  end

  def followed_accounts(user)
    html = ''
    user.followers.limit(3).each do |_follower|
      name = "#{_follower.fullname} \n"
      html << image_tag(_follower.photo, width: '20%') if _follower.photo.attached?
      html << simple_format(name)
      html << (link_to 'View', user_path(_follower.id), class: 'btn btn-primary btn-md', style: 'width:100px')
    end
    html.html_safe
  end
end
