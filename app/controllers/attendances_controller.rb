class AttendancesController < ApplicationController
  before_action :set_user, only: :edit_one_month
  before_action :logged_in_user, only: [:update, :edit_one_month]
  before_action :set_one_month, only: :edit_one_month
 
  UPDATE_ERROR_MSG = "登録に失敗しました。やり直してください。"

  def update
    @user = User.find(params[:user_id])
    @attendance = Attendance.find(params[:id])
    #出勤時間が未登録であることを確認
    if @attendance.started_at.nil?
      if @attendance.update(started_at: Time.current.change(sec: 0))
        flash[:info] = "おはようございます(*'▽')"
      else
        flash[:danger] = UPDATE_ERROR_MSG
      end
    elsif @attendance.finished_at.nil?
      if  @attendance.update(finished_at: Time.current.change(sec: 0))
        flash[:info] = "お疲れ様でした('ω')ノ"
      else
        flash[:danger] = UPDATE_ERROR_MSG
      end
    end
    redirect_to @user
  end

  def edit_one_month
  end 
  def update_one_month
    ActiveRecord::Base.transaction do #トランザクション開始　2021/01/21
      attendances_params.each do |id, item|
        attendance = Attendance.find(id)
        attendance.update_attributes!(item)
      end
    end
    flash[:success] = "1ヶ月分の勤怠情報を更新しました。"
    redirect_to user_url(date: params[:date])
  rescue ActiveRecord::RecordInvalid #トランザクションによるエラーの分岐です。
    flash[:danger] = "無効なデータがあった為、更新をキャンセルしました。"
    redirect_to attendances_edit_one_month_user_url(date: params[:date])
  end 

  private
  #1ヶ月分の勤怠情報を扱います。
  def attendances_params
    params.require(:user).permit(attendances: [:started_at, :finished_at, :note])[:attendances]
  end
end
