class Topico < ApplicationRecord

    has_many :subtopico

    def to_s
        titulo
    end

end
