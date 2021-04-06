class Subtopico < ApplicationRecord
    belongs_to :topico

    def to_s
        titulo
    end
end
