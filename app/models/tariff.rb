class Tariff < ActiveRecord::Base
  belongs_to :region
  belongs_to :equipment
end
