class PokemonsController < ApplicationController
  # skip authenticity for testing purpose
  # skip_before_action :verify_authenticity_token

  before_action :set_pokemon, only: [:show, :update, :destroy]

  # GET /pokemons
  def index
    if params[:name]
      @pokemons = Pokemon.where('lower(name) = ?', params[:name].downcase)
    else
      @pokemons = Pokemon.all.order(:poke_index)
    end

    render :index
  end

  # GET /pokemons/1
  def show
    render :show
  end

  # POST /pokemons
  def create
    @pokemon = Pokemon.new(pokemon_params)

    if params[:pokemon][:image].present?
      @pokemon.image.attach(params[:pokemon][:image])
    end

    if @pokemon.save
      render json: @pokemon, status: :created
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pokemons/1
  def update
    if @pokemon.update(pokemon_params)
      render json: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pokemons/1
  def destroy
    @pokemon.destroy
  end


  private
  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def pokemon_params
    params.require(:pokemon).permit(
      :name,
      :type_1,
      :type_2,
      :total,
      :hp,
      :attack,
      :defense,
      :speed_attack,
      :speed_defense,
      :speed,
      :generation,
      :legendary
    )
  end
end
