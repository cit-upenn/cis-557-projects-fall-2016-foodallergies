#require 'pry'
class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]

  # GET /foods
  # GET /foods.json
  def index
    @foods = Food.all
  end

  # GET /foods/1
  # GET /foods/1.json
  def show
    if @food != nil
      @ingredients = FoodApi.retrieve_results(@food.name)
      @ingredients.map(&:capitalize).each do |ingredient|
        ingredient = Ingredient.find_or_create_by(name: ingredient)
        @food.ingredients << ingredient unless @food.ingredients.include? ingredient
      end      
    end
  end

  def search

    myAllergens = Array.new   # get allergens of the user
    @result = Array.new
    @foodAllergens = Array.new
    if params[:search] != nil
      foodname = params[:search]
    end

    if foodname != nil and foodname != ""
      User.find(current_user.id).allergens.each do |a|
        myAllergens << a.name
      end

      ingredients = FoodApi.retrieve_results(foodname)
      if ingredients.empty?
        @result << "Unknown"
        return @result
      end
      ingredients.map(&:capitalize).each do |ingredient|
        ingredient = Ingredient.find_or_create_by(name: ingredient)
        ingredient.allergens.each do |a|
          @foodAllergens << a.name
          if myAllergens.include? a.name
            @result << a.name
          end
        end
      end
      @result.uniq!
      @foodAllergens.uniq!
    end
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods
  # POST /foods.json
  def create
    @food = Food.new(food_params)

    respond_to do |format|
      if @food.save
        # binding.pry
        # @food.add_allergen(params[:food][:allergen_ids])
        format.html { redirect_to @food, notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1
  # PATCH/PUT /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to @food, notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    #something is modified here
    def food_params
      params.require(:food).permit(:name, :product_barcode)
    end
end
