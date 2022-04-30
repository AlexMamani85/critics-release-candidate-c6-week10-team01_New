class CriticsController < ApplicationController
  # POST /critics
  def create
    if params[:game_id]
      game = Game.find(params[:game_id])
      @critic = game.critics.create(critic_params)
    elsif params[:company_id] 
      company = Company.find(params[:company_id])
      @critic = company.critics.create(critic_params)
    end
    @critic.user = current_user
    if @critic.save
      redirect_to game || company, notice: "Critic was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end


  # DELETE /critics/1
  def destroy
    @critics = Critic.find(params[:id])
    @critics.delete
    if params[:game_id]
      redirect_to games_path, notice: "Critic was successfully destroyed."
    elsif params[:company_id]
      redirect_to companies_path, notice: "Critic was successfully destroyed."
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def critic_params
      params.require(:critic).permit(:title, :body)
    end
end
