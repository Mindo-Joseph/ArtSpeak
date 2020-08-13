module UsersHelper
    def renderCoverImage(user)
       if user.coverImage.attached?
        image_tag(user.coverImage, class:"w-100 h-50 border-bottom pb-2 pr-0")
       end
    end
    def renderPhoto(user)
        if user.photo.attached?
            image_tag(user.photo, width:'15%', class:"rounded-circle ")
        end
    end
    def relationship_action(user)
        ids = user.followers.pluck(:id)
        if user == current_user
            link_to "Edit Profile", edit_user_path(user.id)
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
        ids = user.followings.pluck(:id)
        suggestions = []
        if ids.size == 0
            User.all.each do |item|
                suggestions << renderPhoto(item)
                suggestions << item.fullname
            end
        else
            User.where.not(id:ids).each do |item|
                suggestions << renderPhoto(item)
                suggestions << item.fullname
            end
        end
        tags = html_escape('')
        suggestions.collect { |suggest| tags << tag.p(suggest,class:'suggestion')}
        suggestions
    end
end
