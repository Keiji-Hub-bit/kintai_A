class BasePoint < ApplicationRecord
  validates :base_number,presence: true, uniqueness: true, numericality: {only_integer: true, greater_than_or_equal_to: 0} #2/12追加
  validates :base_name, presence: true #2/12追加
  validates :base_kind, inclusion: { in: ["出勤", "退勤"]} #2/12追加
end
