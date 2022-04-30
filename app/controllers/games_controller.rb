class GamesController < ApplicationController
  before_action :set_game, only: %i[ edit update destroy show ]

  # GET /games
  def index
    @games = Game.all
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to @game, notice: "Game was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      redirect_to @game, notice: "Game was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
    redirect_to games_url, notice: "Game was successfully destroyed."
  end

  def show 
    @critics = @game.critics
    @new_critic = Critic.new
  end

  def add_genre
    game = Game.find(params[:id])
    genre = Genre.find(params[:genre_id])

    game.genres << genre
    redirect_to game
  end

  def remove_genre
    game = Game.find(params[:id])
    genre = Genre.find(params[:genre_id])

    game.genres.delete(genre)
    redirect_to game, status: :see_other
  end

  def add_platform
    game = Game.find(params[:id])
    platform = Platform.find(params[:platform_id])

    game.platforms << platform
    redirect_to game
  end

  def remove_platform
    game = Game.find(params[:id])
    platform = Platform.find(params[:platform_id])

    game.platforms.delete(platform)
    redirect_to game, status: :see_other
  end

  def add_developer
    game = Game.find(params[:id])
    company = Company.find(params[:company_id])

    game.involved_companies.create(developer: true, publisher: false, company: company)
    redirect_to game, status: :see_other
  end

  def remove_developer
    game = Game.find(params[:id])
    invcomp = InvolvedCompany.find(params[:invol_id])

    game.involved_companies.delete(invcomp)
    redirect_to game, status: :see_other
  end

  def add_publisher
    game = Game.find(params[:id])
    company = Company.find(params[:company_id])

    game.involved_companies.create(developer: false, publisher: true, company: company)
    redirect_to game, status: :see_other
  end

  def remove_publisher
    game = Game.find(params[:id])
    invcomp = InvolvedCompany.find(params[:invol_id])

    game.involved_companies.delete(invcomp)
    redirect_to game, status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:name, :summary, :release_date, :category, :rating, :parent_id, :cover)
    end
end
