class Rank
    include Comparable
    attr_reader :grade

    def initialize(rank_string)
        @rank_string = rank_string.downcase

        # FIXME
        raise ArgumentError unless /[kdp]$/.match(@rank_string)

        @grade = case @rank_string.last
        when 'k'
            :kyu
        when 'd'
            :dan
        when 'p'
            :pro
        end
    end

    def strength
        value = @rank_string.to_i
        case grade
        when :kyu
            -value
        when :dan
            value - 1
        when :pro
            value + 8
        end
    end

    def <=>(other)
        strength <=> other.strength
    end

    def -(other)
        strength - other.strength
    end

    def to_s
        @rank_string
    end
end
