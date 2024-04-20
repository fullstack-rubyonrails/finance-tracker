class UsersController < ApplicationController

  def my_portfolio
    @tracked_stocks =current_user.stocks
    @user = current_user
    # now use this  @tracked_stocks  in my  protfolio to show stock details
  end

  def my_friends
    @friends = current_user.friends
  end
  def show
    @user = User.find(params[:id])
    @tracked_stocks = @user.stocks
  end
  # def search
  #   render json: params[:friend]
  # end

# end

def search
  # convert friend to @friend instance variable to access in my_friend page and display friend's details there.
    if params[:friend].present?
      # Below line will return multiple lines so instance variable is  friends not friend
      @friends = User.search(params[:friend])
      @friends = current_user.except_current_user(@friends)
      if @friends
        respond_to do |format|
          format.js {  render partial: 'users/friend_result' }
        end
        # render 'users/my_portfolio' (Remove this because "respond_to" added above)
      else
        # Here for-invalid & empty stock symbol we are using same format as in IF (valid symbol) block
        respond_to  do |format|
          # to remove flash persistence will  falsh.now
          flash.now[:alert] = "Couldn't find user"
          format.js {  render partial: 'users/friend_result' }
        end
      end
    else
      respond_to  do |format|
        # to remove flash persistence will  falsh.now
        flash.now[:alert] = "Please enter a friend name or email"
        format.js {  render partial: 'users/friend_result' }
      end
    end
  end
end
