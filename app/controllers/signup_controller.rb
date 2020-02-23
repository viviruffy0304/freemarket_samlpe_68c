class SignupUsersController < ApplicationController
  before_action :save_step1_to_session, only: :step2
  before_action :save_step2_to_session, only: :step3

  def step1
    @user = User.new
    @user.build_address
  end

  def save_step1_to_session
    session[:user_params] = user_params
    session[:address_attributes_after_step1] = user_params[:address_attributes]
    @user = User.new(session[:user_params])
    @user.build_address(session[:address_attributes_after_step1])
    render '/signup/step1' unless @user.valid?
  end 

  def step2
    session[:user_params] = user_params  #userモデルの値
    session[:address_attributes_after_step1] = user_params[:address_attributes]  # addressモデルの値
    @user = User.new
    @user.build_address
  end

  def save_step2_to_session
    session[:address_attributes_after_step2] = user_params[:address_attributes]
    session[:address_attributes_after_step2].merge!(session[:address_attributes_after_step1])
    @user = User.new
    @user.build_address(session[:address_attributes_after_step2])
    render '/signup/step2' unless session[:address_attributes_after_step2][:phone_number].present?
  end


  def step3
    session[:address_attributes_after_step2] = user_params[:address_attributes]  # step2で入力された情報。
    session[:address_attributes_after_step2].merge!(session[:address_attributes_after_step1])  # step2のsessionにstep1のsessionの中身を合わせる。
    @user = User.new
    @user.build_address
  end

  def create
    @user = User.new(session[:user_params])  # ここでuserモデルのsessionを引数で渡す。
    @user.build_address(session[:address_attributes_after_step1])  # ここでaddressモデルのsessionを引数で渡す。
    @user.build_address(user_params[:address_attributes])  # 今回のビューで入力された情報を代入。
    if @user.save
      session[:id] = @user.id  #　ここでidをsessionに入れることでログイン状態に持っていく。
      redirect_to complete_signup_signup_index_path
    else
      render '/signup/step1'
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password, 
      :password_confirmation,
      :first_name,
      :last_name,
      :f_first_name,
      :f_last_name,
      :birth_year,
      :birth_month,
      :birth_day,
      address_attributes: [:id, :phone_number, :postal_code, :prefectures, :municipalities, :address, :building]
    )
  end


end
