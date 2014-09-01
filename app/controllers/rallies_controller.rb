class RalliesController < ApplicationController
  before_action :check_signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :check_correct_user, only: [:edit, :update, :destroy] 
  before_action :set_rally, only: [:show, :edit, :update, :destroy]

  # GET /rallies
  # GET /rallies.json
  def index
    @rallies = Rally.all.paginate(page: params[:page])
  end

  # GET /rallies/1
  # GET /rallies/1.json
  def show
  end

  # GET /rallies/new
  def new
    @rally = Rally.new
  end

  # GET /rallies/1/edit
  def edit
  end

  # POST /rallies
  # POST /rallies.json
  def create
    @rally = current_user.rallies.build(rally_params)

    respond_to do |format|
      if @rally.save
        format.html { redirect_to @rally, notice: 'Rally was successfully created.' }
        format.json { render :show, status: :created, location: @rally }
      else
        format.html { render :new }
        format.json { render json: @rally.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rallies/1
  # PATCH/PUT /rallies/1.json
  def update
    respond_to do |format|
      if @rally.update(rally_params)
        format.html { redirect_to @rally, notice: 'Rally was successfully updated.' }
        format.json { render :show, status: :ok, location: @rally }
      else
        format.html { render :edit }
        format.json { render json: @rally.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rallies/1
  # DELETE /rallies/1.json
  def destroy
    @rally.destroy
    respond_to do |format|
      format.html { redirect_to rallies_url, notice: 'Rally was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rally
      @rally = Rally.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rally_params
      params.require(:rally).permit(:title, :content, :twitter_template, :user_id)
    end

    def check_correct_user
      set_rally
      redirect_to root_url unless current_user?(@rally.user)
    end
end
