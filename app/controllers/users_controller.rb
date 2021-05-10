class UsersController < ApplicationController
  def search
    @people = if params[:search]
                User.where('email LIKE ?', "#{params[:search]}%")
              else
               User.all
              end
    respond_to do |format|
      format.json {render :json => @people }
    end
	end
end
