# frozen_string_literal: true

# Controller for authorization
class Ability
  include CanCan::Ability

  def initialize(user)
    common_abilities

    return if user.blank?

    user_abilities(user)

    return unless user.admin?

    admin_abilities
  end

  private

  def common_abilities
    can :read, [Category,
                Group,
                Subject,
                SubjectTime]

    can :read, Task, created_by_admin: true
  end

  def user_abilities(user)
    can :create, Task
    can %i[my_tasks read update destroy], Task, author: user
  end

  def admin_abilities
    can :manage, [Category,
                  User,
                  Group,
                  Subject,
                  RolesController,
                  SubjectTime]
  end
end
