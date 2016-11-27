class UsersController < ApplicationController

    def show
    end

	def settings
		@user = User.find(params[:id])
		@name = User.find(params[:id]).username
	end

	def update
	  @user = User.find(params[:id])
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to controller: 'users', action: 'settings', id: current_user.id, 
          	notice: 'User settings was successfully updated.'}
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

      private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = user.find(params[:id])
    end
    def user_params
    	params.require(:user).permit(
    		:username,
    		:id,
    		:email,
    		{:allergen_ids => []}
    	)
    end

end
