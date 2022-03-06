class Planstag < ApplicationRecord
  belongs_to :plan
  belongs_to :tag
end
