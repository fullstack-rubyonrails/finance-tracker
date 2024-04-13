class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks =current_user.stocks
    # now use this  @tracked_stocks  in my  protfolio to show stock details
  end
end
