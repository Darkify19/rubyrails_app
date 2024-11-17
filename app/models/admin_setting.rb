class AdminSetting < ApplicationRecord
    validates :setting_key, uniqueness: true, presence: true
    validates :setting_value, presence: true
  end
  