class SessionsController < ApplicationController
  def create
    data = SearchFacade.access(params[:code])
    access_token = AccessToken.new(data).token

    data = SearchFacade.user_data(access_token)

    user = User.find_or_create_by(uid: data[:id])
    user.username = data[:login]
    user.uid = data[:id]
    user.token = access_token
    user.save

    session[:user_id] = user.id

    redirect_to dashboard_path
  end
end