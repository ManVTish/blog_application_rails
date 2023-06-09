# frozen_string_literal: true

class DashboardPolicy < ApplicationPolicy
  attr_reader :user

  def initialize(user, _record)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
  end

  def index?
    user.admin? || user.superadmin
  end
end
