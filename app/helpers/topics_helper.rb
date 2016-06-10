module TopicsHelper

  def user_is_authorized_for_topics_update?
      current_user.admin? || current_user.moderator?
  end

  def user_is_authorized_for_topics_delete?
    current_user.admin?
  end

  def user_is_authorized_for_topics_create?
    current_user.admin?
  end
end
