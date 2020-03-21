# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    redirect_to(current_user) && return if user_signed_in?
  end
end
