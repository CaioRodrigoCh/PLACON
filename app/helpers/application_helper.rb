module ApplicationHelper
  def avatar_url user
    return user.file.first if user.file.first
    "default-user-image"
  end
end
