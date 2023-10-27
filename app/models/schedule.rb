class Schedule < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :StartDate, presence: true
  validates :EndDate, presence: true
  validates :memo, length: { maximum:500 }
  
  validate :start_end_check
  

  def start_end_check
    return if StartDate.blank? || EndDate.blank?
    errors.add(:EndDate, "は開始日以降の日付で選択してください") if self.StartDate > self.EndDate
  end
end