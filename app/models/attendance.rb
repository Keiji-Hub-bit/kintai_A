class Attendance < ApplicationRecord
  belongs_to :user
  has_one :log, dependent: :destroy

  validates :worked_on, presence: true
  validates :note, length: { maximum: 50 }


  #出勤時間が存在しない場合は、退勤時間は無効
  validate :finished_at_is_invalid_without_a_started_at
  #出勤・退勤どちらも存在する時、出勤時間より早い退勤時間は無効
  validate :started_at_than_finished_at_fast_if_invalid

  def finished_at_is_invalid_without_a_started_at
    errors.add(:started_at, "が必要です") if started_at.blank? && finished_at.present?
  end

  def started_at_than_finished_at_fast_if_invalid
    if started_at.present? && finished_at.present?
      errors.add(:started_at, "より早い退勤時間は無効です。") if started_at > finished_at
    end
  end

  def work_content_present
    errors.add(:work_content,"の入力が必要です") if work_content.blank?
  end

#「Enum」は「列挙型」 モデルの数値カラムに対して文字列による名前定義をマップすることができます
#上長確認カラム not:なし, approval:承認, denial:否認, applying: 申請中
enum instructor_confirmation_month: {"なし" => 0, "承認" => 1, "否認" => 2, "申請中" => 3},_prefix:true 

end
