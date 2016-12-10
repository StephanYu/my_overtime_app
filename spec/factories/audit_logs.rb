FactoryGirl.define do
  factory :audit_log do
    user nil
    status 0
    start_date (Date.today - 6.days)
    end_date nil
  end
end
