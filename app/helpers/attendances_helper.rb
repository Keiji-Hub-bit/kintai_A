module AttendancesHelper
 
  def attendance_state(attendance)
     #受け取ったAttendanceオブジェクトが当日と一致するか評価する。
    if Date.current == attendance.worked_on
      return '出勤' if attendance.started_at.nil?
      return '退勤' if attendance.started_at.present? && attendance.finished_at.nil?
    end
    #どちらにも当てはまらなかった場合は、falseを返す。
    false
  end
  #出勤時間と退勤時間を受け取り、在社時間を計算して返します。
    def working_times(start, finish)
      format("%.2f", (((finish - start) / 60) /60.0))
    end
    #指定勤務開始と指定勤務終了時間を受け取り、総合後継算して返します。
    def working_times(start, finish)
      format("%.2f", (((finish - start) / 60) /60.0))
    end
end
