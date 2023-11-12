class ApplicationController < ActionController::Base
  before_action :authenticate
  helper_method :logged_in?

  private

  def logged_in?
    !!current_user
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end


  # わかりやすく書いた例
  # def current_user
  # # もしセッションにユーザーIDが存在しなければ、ログインしていないのでnilを返す
  # if session[:user_id].nil?
  #   return nil
  # end

  # # もし @current_user がまだ設定されていなければ、データベースから取得して設定する
  # if @current_user.nil?
  #   @current_user = User.find(session[:user_id])
  # end

  # # @current_user を返す
  # return @current_user
  # end

  def authenticate
    return if logged_in?
    redirect_to root_path, alert: "ログインしてください"
  end
end
