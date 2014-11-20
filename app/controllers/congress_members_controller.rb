class CongressMembersController < ApplicationController
  before_action :check_signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :check_admin_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_congress_member, only: [:show, :edit, :update, :destroy]

  # GET /congress_members
  # GET /congress_members.json
  def index
    @congress_members = CongressMember.all
  end

  # GET /congress_members/1
  # GET /congress_members/1.json
  def show
  end

  # GET /congress_members/new
  def new
    @congress_member = CongressMember.new
  end

  # GET /congress_members/1/edit
  def edit
  end

  # POST /congress_members
  # POST /congress_members.json
  def create
    @congress_member = CongressMember.new(congress_member_params)

    respond_to do |format|
      if @congress_member.save
        format.html { redirect_to @congress_member, notice: 'Congress Member was successfully created.' }
        format.json { render :show, status: :created, location: @congress_member }
      else
        format.html { render :new }
        format.json { render json: @congress_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /congress_members/1
  # PATCH/PUT /congress_members/1.json
  def update
    respond_to do |format|
      if @congress_member.update(congress_member_params)
        format.html { redirect_to @congress_member, notice: 'Congress Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @congress_member }
      else
        format.html { render :edit }
        format.json { render json: @congress_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /congress_members/1
  # DELETE /congress_members/1.json
  def destroy
    @congress_member.destroy
    respond_to do |format|
      format.html { redirect_to congress_members_url, notice: 'Congress Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_congress_member
      @congress_member = CongressMember.find(params[:id])
    end

    # def type_by_house
    #   if  CongressMember.types.include?(params[:type])
    #     params[:type] 
    #   else
    #     "CongressMember"
    #   end
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def congress_member_params
      params.require(:congress_member).permit(:first_name, :last_name, :state, :district, :party, :twitter_handle, :type_by_house)
    end
end
