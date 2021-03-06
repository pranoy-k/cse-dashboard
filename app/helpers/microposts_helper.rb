module MicropostsHelper
    def admin_not_tagged?(post)
        post.tag.nil? || post.tag.eql?("")
    end
    
    def correct_user?(user, post)
        user != nil && post.tag.to_i == user.id
    end
end
