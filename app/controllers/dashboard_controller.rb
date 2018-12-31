class DashboardController < ApplicationController
  def index
    # @walks_today = Walk.where("date >= ?", Time.now.beginning_of_day).order("date desc")
    @walks_today = Walk.joins(:user).select("walks.date, string_agg(users.username, ', ') as username, walks.duration").where("date >= ?", Time.now.beginning_of_day).group(:date,:duration).order("date desc")
    unless @walks_today.blank?
      @last_walk_in_h = ((Time.now.in_time_zone + 3600 - @walks_today.first.date)/3600).to_i
    end
  end
end
