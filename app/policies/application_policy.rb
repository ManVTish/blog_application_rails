# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @record = record
  end

  def index?
    # false
    true
  end

  def show?
    # false
    true
  end

  def create?
    # false
    user.superadmin?
  end

  def new?
    create?
  end

  def update?
    # false
    user.superadmin?
  end

  def edit?
    update?
  end

  def destroy?
    # false
    user.superadmin?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    def initialize(user, scope)
      raise Pundit::NotAuthorizedError, "must be logged in" unless user
      @user = user
      @scope = scope
    end

    def resolve
      # raise NotImplementedError, "You must define #resolve in #{self.class}"
      scope
    end

    private

    attr_reader :user, :scope
  end
end
