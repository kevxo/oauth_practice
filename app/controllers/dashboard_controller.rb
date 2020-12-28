class DashboardController < ApplicationController
  def show
    @repos = SearchFacade.repos(current_user.token)
  end
end