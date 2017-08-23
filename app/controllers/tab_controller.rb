class TabController < ApplicationController
  def index
    if current_user
      binding.pry
      @github_user = GithubUser.user_current_info(current_user.username, current_user.token)
    end
  end
end