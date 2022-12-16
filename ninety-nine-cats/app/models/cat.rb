# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'action_view'

class Cat < ApplicationRecord
    # include DateHelper
    include ActionView::Helpers::DateHelper
    CAT_COLORS = [:white, :black, :grey, :orange, :hairless, :brown ]
    validates :birth_date, :name, presence: true
    validates :color, presence: true, inclusion: {in: CAT_COLORS,  message: "%{value} is not a valid color" }
    validates :sex, presence: true, inclusion: {in: %w(M F),  message: "%{value} is not a valid sex" }
    validate :birth_date_cannot_be_future

    def birth_date_cannot_be_future
        kitty = self
        if kitty.birth_date && kitty.birth_date > Date.today
            errors.add(:birth_date, "can't be in the future")
        end
    end


    def age 
        time_ago_in_words(birth_date.years.from_now)
    end

    
end
