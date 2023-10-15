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
                Task,
                Subject]
    can :time, SubjectTime
  end

  def user_abilities(user)
    can :create, Task
    can :task_dropdowns, DropdownsController
    can %i[my_tasks update destroy], Task, author: user
  end

  def admin_abilities
    can :manage, [Category,
                  Group,
                  Subject,
                  RolesController,
                  SubjectTime]
  end
end
