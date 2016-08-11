module UsersHelper

  def image_for(user, options = {size: 80})
    size = options[:size]
    if user.image?
      image_tag user.image.url(:big), width:  size
    else
      image_tag "profle.png", width:  size
    end
  end

end
