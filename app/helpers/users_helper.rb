module UsersHelper
  def render_cover_image(user)
    image_tag(user.coverImage, class: 'w-100 h-50 border-bottom pb-2 pr-0') if user.coverImage.attached?
  end

  def render_photo(user)
    image_tag(user.photo, width: '25%', height: '25%') if user.photo.attached?
  end

  def render_photo_aside(user)
    image_tag(user.photo, width: '80%', height: '80%') if user.photo.attached?
  end

  def relationship_action(user)
    ids = user.followers.pluck(:id)
    if user == current_user
      out = []
      out << (link_to 'Edit Profile', edit_user_path(user.id), class: 'btn btn-primary mr-2')
      out << (link_to 'Delete Account', user_path(user.id), class: 'btn btn-danger ', method: 'delete')
      safe_join(out)
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
    out = []

    return all_users(user) if following_count(user).zero?

    ids = user.followings.pluck(:id)
    ids << current_user.id
    User.where.not(id: ids).order(created_at: :desc).limit(3).each do |person|
      name = "#{person.fullname} \n"
      out << image_tag(person.photo, width: '20%') if person.photo.attached?
      out << simple_format(name)
      out << (link_to 'Follow', follow_user_path(person.id), class: 'btn btn-primary btn-md', method: 'post')
      out << (link_to 'View', user_path(person.id), class: 'btn btn-primary btn-md')
    end

    safe_join(out)
  end

  def all_users(user)
    out = []
    User.where.not(id: user.id).order(created_at: :desc).each do |person|
      name = "#{person.fullname} \n"
      out << (image_tag(person.photo, width: '150px', height: '150px') if person.photo.attached?)
      out << simple_format(name)
      if current_user.followings.pluck(:id).include?(person.id)
        out << (link_to 'Unfollow', unfollow_user_path(person.id), class: 'btn btn-danger', method: 'post')
        out << (link_to 'View', user_path(person.id), class: 'btn btn-primary btn-md')
      end
      unless current_user.followings.pluck(:id).include?(person.id)
        out << (link_to 'Follow', follow_user_path(person.id), class: 'btn btn-primary ', method: 'post')
        out << (link_to 'View', user_path(person.id), class: 'btn btn-primary btn-md')
      end
    end
    safe_join(out)
  end

  def followed_accounts(user)
    out = []
    user.followers.limit(3).each do |follower|
      name = "#{follower.fullname} \n"
      out << image_tag(follower.photo, width: '20%') if follower.photo.attached?
      out << simple_format(name)
      out << (link_to 'View', user_path(follower.id), class: 'btn btn-primary btn-md', style: 'width:100px')
    end
    safe_join(out)
  end
end
