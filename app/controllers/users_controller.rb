class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  
  def index
    @users = User.all
  end

  def show
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
      redirect_to @user  
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :department, :employee_number, :card_ID, :password, :basic_time, :work_start_time, :work_finish_time)
    end

  #beforeフィルター

  #paramsハッシュからユーザーを取得
  def set_user
    @user = User.find(params[:id])
  end

  #ログイン済のユーザーか確認する。
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
    end
  end
  
  #アクセスしたユーザーが現在ログインしているユーザーかを確認する。
  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end

  #システム管理権限所有かどうかを判定します。
  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end