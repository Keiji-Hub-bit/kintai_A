class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy, :edit_basic_info, :update_basic_info]
  before_action :set_one_month, only: :show
  

  def index
    @users = User.all
    @user = User.find_by(params[:id])
  end

  def import
    if params[:file].blank?
      flash[:danger] = "CSVファイルが選択されていません。"
      redirect_to users_url
    else
      User.import(params[:file])
      flash[:success] = "ユーザーを追加しました。"
      redirect_to users_url
    end
  end

  def staff_at_work
    @in_working_users = User.in_working_users
  end

  
  def show
    @worked_sum = @attendances.where.not(started_at: nil?).count
    @attendance = @user.attendances.find_by(worked_on: @first_day)
    @superior = User.where(superior: true)
    @month = Attendance.where(instructor_confirmation_month: "申請中", instructor_confirmation_month:@user.name).count
  end
  
  def new
    @user = User.new # ユーザーオブジェクトを生成し、インスタンス変数に代入します。
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user # 保存成功後、ログインします。
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      if current_user.admin?
        redirect_to users_url
      else
        redirect_to @user 
      end
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end

  def edit_basic_info
  end

  def update_basic_info
    if @user.update(basic_info_params)
      flash[:success] = "全ユーザーの基本情報を更新しました。"
    else
      flash[:danger] = "基本情報の更新に失敗しました。<br>" + @user.errors.full_messages.join("<br>")
    end
    redirect_to users_url
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :department, :employee_number, :card_ID, :password, :basic_time, :work_start_time, :work_finish_time)
    end

    def basic_info_params
      params.require(:user).permit(:department, :basic_time, :work_time)
    end

end
