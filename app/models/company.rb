class Company < ApplicationRecord
  validates :info, presence: true
end
