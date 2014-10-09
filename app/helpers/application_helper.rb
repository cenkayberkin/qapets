module ApplicationHelper

  def avatar_url(user)
   default_url = "#{root_url}images/puppy.png"
   gravatar_id = Digest::MD5::hexdigest(user.email).downcase
   "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&"
  end

  def avatar_show(user)
    default_url = "#{root_url}images/puppy.png"
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=200&"
  end

  def avatar_nav(user)
    default_url = "#{root_url}images/puppy.png"
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=20&"
  end
end
