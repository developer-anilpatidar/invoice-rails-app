class Invoice < ApplicationRecord
  
  scope :filter_with_date, -> (dateFrom, dateTo) { where("date between (?) and (?)", dateFrom, dateTo)}
end
