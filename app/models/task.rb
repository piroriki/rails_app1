class Task < ApplicationRecord
 validates :title, presence: true
 validates :created_at, presence: true
 validates :finished_day, presence: true
 validates :memo, length: {in:0..200}

 validate :start_before_today
 validate :start_before_finish

 def start_before_today # 開始日が本日ならエラーになる
   if created_at < Date.today
   errors.add(:created_at,"開始日は本日以降を入力してください")
   end
 end

 def start_before_finish # 終了日が開始日より前、もしくは終了日が本日より以前ならエラーになる
   if finished_day < created_at || finished_day < Date.today
    errors.add(:finished_day,"終了日は開始日以降を入力してください")
   end
 end
end