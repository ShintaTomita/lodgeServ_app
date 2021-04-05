class Book < ApplicationRecord
belongs_to :user, optional: true
belongs_to :room, optional: true

validates :check_in, presence: true
validates :check_out, presence: true
validates :customers, presence: true

validate :date_before_start
validate :date_before_end
validate :number_before_customers

def date_before_start
  errors.add(:check_in, "は明日以降の日付を選択してください") if check_in <= Date.today
end

def date_before_end
  errors.add(:check_out, "はチェックイン以降の日付を選択してください") if check_out <= check_in
end

def number_before_customers
  errors.add(:customers, "はお一人以上を選択してください") if customers < 0
end

end
