class AttendancesController < ApplicationController
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
end
