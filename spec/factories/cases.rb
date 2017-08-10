FactoryGirl.define do
  factory :case do |f|
    f.issue_id 1
    f.name "Doe v. Roe"
    f.cite1 "1 U.S. 1"
    f.date_decided { 10.years.ago }
  end
end