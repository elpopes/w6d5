class Cat < ApplicationRecord
    CAT_COLORS = [:white, :black, :grey, :orange, :hairless, :brown ]

    validates :birth_date, :name, :sex, presence :true
    validate :color, presence :true, inclusion: {in: CAT_COLORS }

end