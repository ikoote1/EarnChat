class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role == 'admin'
      can :destroy, Post
    else
      can :destroy, Post, author_id: user.id
    end

    can :read, Post

    can :destroy, Comment, user_id: user.id
    can :destroy, Comment do |_comment|
      user.role == 'admin'
    end
  end
end
