class ReferralsController < ApplicationController
  before_action :set_referral, only: %i[show edit update destroy]

  # GET /referrals
  def index
    if current_user.teacher?
      @referrals = Referral.where(teacher: current_user)
    elsif current_user.admin?
      @referrals = Referral.all
    elsif current_user.counselor?
      @referrals = Referral.where(status: %w[approved_pending_counselor in_progress])
    else
      @referrals = Referral.none
    end
  end

  # GET /referrals/new
  def new
    @referral = Referral.new
  end

  # POST /referrals
  def create
    @referral = Referral.new(referral_params)
    @referral.teacher = current_user if current_user.teacher?

    if @referral.save
      redirect_to referrals_path, notice: "Referral created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /referrals/:id/edit
  def edit
  end

  # PATCH/PUT /referrals/:id
  def update
    if @referral.update(referral_params)
      redirect_to referrals_path, notice: "Referral updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /referrals/:id
  def destroy
    @referral.destroy
    redirect_to referrals_path, notice: "Referral deleted successfully."
  end

  private

  def set_referral
    @referral = Referral.find(params[:id])
  end

  def referral_params
    permitted = [:student_name, :student_info, :status, :admin_signature, :counselor_notes]

    # Optionally allow only certain fields for certain roles
    if current_user.teacher?
      permitted = [:student_name, :student_info]
    elsif current_user.admin?
      permitted = [:status, :admin_signature]
    elsif current_user.counselor?
      permitted = [:counselor_notes]
    end

    params.require(:referral).permit(permitted)
  end
end
