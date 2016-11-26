class DiaryEntriesController < ApplicationController
  before_action :set_diary_entry, only: [:show, :edit, :update, :destroy]

  # GET /diary_entries
  # GET /diary_entries.json
  def index
    @diary_entries = DiaryEntry.all
  end

  def admin_index
    @diary_entries = DiaryEntry.all
  end

  # GET /diary_entries/1
  # GET /diary_entries/1.json
  def show
  end

  # GET /diary_entries/new
  def new
    @diary_entry = DiaryEntry.new
  end

  # GET /diary_entries/1/edit
  def edit
  end


  # TODO: associate with the allergens of this user
  def check_allergens(foodname)
    food = Food.find_by_name(foodname)
    if food != nil
      allergens = food.allergens
      if allergens != nil
        result = "WARNING: Allergens detected ("
        allergens.each do |a|
          result << a.name
          if a != allergens.last
            result << ", "
          else
            result <<")!\n"
          end
        end
        result << "Click \"OK\" if you insist to have it, otherwise click \"Cancel\"."
        return result
      end
    end
    return nil
  end
  helper_method :check_allergens

  # POST /diary_entries
  # POST /diary_entries.json
  def create
    @diary_entry = DiaryEntry.new(diary_entry_params)
    @diary_entry.user_id = current_user.id

    respond_to do |format|
      if @diary_entry.save
        format.html { redirect_to @diary_entry, notice: 'Diary entry was successfully created.' }
        format.json { render :show, status: :created, location: @diary_entry }
      else
        format.html { render :new }
        format.json { render json: @diary_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diary_entries/1
  # PATCH/PUT /diary_entries/1.json
  def update
    respond_to do |format|
      if @diary_entry.update(diary_entry_params)
        format.html { redirect_to @diary_entry, notice: 'Diary entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @diary_entry }
      else
        format.html { render :edit }
        format.json { render json: @diary_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diary_entries/1
  # DELETE /diary_entries/1.json
  def destroy
    @diary_entry.destroy
    respond_to do |format|
      format.html { redirect_to diary_entries_url, notice: 'Diary entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diary_entry
      @diary_entry = DiaryEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diary_entry_params
      params.require(:diary_entry).permit(:time, :meal, :food, :amount, :user_id)
    end
end
