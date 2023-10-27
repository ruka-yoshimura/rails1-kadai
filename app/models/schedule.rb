class Schedule < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :memo, length: { maximum:500 }
  
  validate :start_end_check
  

  def start_end_check
    return if start_date.blank? || end_date.blank?
    errors.add(:end_date, "は開始日以降の日付で選択してください") if self.start_date > self.end_date
  end
end