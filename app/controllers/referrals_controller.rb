class ReferralsController < ApplicationController
  before_action :set_referral, only: %i[ show edit update destroy ]

  # GET /referrals or /referrals.json
  def index
    @referrals = Referral.all
  end

  # GET /referrals/1 or /referrals/1.json
  def show
  end

  # GET /referrals/new
  def new
    @referral = Referral.new
  end

  # GET /referrals/1/edit
  def edit
  end

  # POST /referrals or /referrals.json
  def create
    @referral = Referral.new(referral_params)

    respond_to do |format|
      if @referral.save
        format.html { redirect_to @referral, notice: "Referral was successfully created." }
        format.json { render :show, status: :created, location: @referral }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @referral.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referrals/1 or /referrals/1.json
  def update
    respond_to do |format|
      if @referral.update(referral_params)
        format.html { redirect_to @referral, notice: "Referral was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @referral }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @referral.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referrals/1 or /referrals/1.json
  def destroy
    @referral.destroy!

    respond_to do |format|
      format.html { redirect_to referrals_path, notice: "Referral was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referral
      @referral = Referral.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def referral_params
      params.require(:referral).permit(:student_name, :student_info, :status, :teacher_id, :counselor_id, :admin_id)
    end
end
