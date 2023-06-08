# frozen_string_literal: true

module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    if current_user
      flash.clear
      redirect_to(user_session_path) and return
    else
      flash.clear
      redirect_to(admin_user_session_path) and return
    end
  end
end
