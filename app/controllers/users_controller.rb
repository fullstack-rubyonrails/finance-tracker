class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks =current_user.stocks
    # now use this  @tracked_stocks  in my  protfolio to show stock details
  end
  def my_friends
    @friends = current_user.friends
  end
end
