class DiaryEntriesController < ApplicationController
  before_action :set_diary_entry, only: [:show, :edit, :update, :destroy]

  # GET /diary_entries
  # GET /diary_entries.json
  def index
    @diary_entries = DiaryEntry.where("user_id = ?", current_user.id).order('time')
  end

  def admin_index
    @diary_entries = DiaryEntry.all.order('time')
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

  # return an array of allergens
  def get_allergens(foodname)
    food = Food.find_by_name(foodname.humanize)
    result = Array.new
    if food != nil
      allergens = food.allergens  # get allergens of the food
      if allergens != nil
        myAllergens = Array.new   # get allergens of the user
        User.find(current_user.id).allergens.each do |a|
          myAllergens << a.name
        end
        allergens.each do |a|
          if myAllergens.include? a.name
            result << a.name
          end
        end
      end
    end
    return result
  end
  helper_method :get_allergens

  def sort
    @diary_entries = []
    if (DiaryEntry.attribute_names.include? (params[:field])) then
      @diary_entries = DiaryEntry.where("user_id = ?", current_user.id).order(params[:field])
    end
    
    render :index
  end


  def download
    @diary_entries = DiaryEntry.where("user_id = ?", current_user.id).order('time')
    @user_id = current_user.id
    html = render_to_string(:layout => false , :action => "download.html.erb") # your view erb files goes to :action 
    kit = PDFKit.new(html)
    send_data(kit.to_pdf, :filename=>"#{@user_id}.pdf",
      :type => 'application/pdf', :disposition => 'inline')
  end


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
      params.require(:diary_entry).permit(:time, :meal, :food, :amount)
    end
end
