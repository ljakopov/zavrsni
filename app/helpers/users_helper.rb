module UsersHelper

  def image_for(user, options = {size: 80})
    size = options[:size]
    if user.image?
      image_tag user.image.url(:big), width:  size
    else
      image_tag "profle.png", width:  size
    end
  end

  def admin_tag(user, options = {size: 35})
    size = options[:size]
    if user.admin==false
      image_tag "1472399018_Asian_boss.png", width:  size
    else
      image_tag "1472398941_admin.png", width:  size
    end
  end

  def activate_tag(user, options = {size: 35})
  size = options[:size]
  if user.activate==false
    image_tag "1472400498_cancel.png", width:  size
  else
    image_tag "1472400490_ok.png", width:  size
  end
  end

  def admin(user)
    if user.admin
       "User"
    else
      "Admin"
    end
  end

  def active(user)
    if user.activate
      "InActive"
    else
      "Active"
    end
  end

end
