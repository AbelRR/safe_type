module SafeType
  class DateTime < Rule
    def initialize(type: ::DateTime, from: nil, to: nil, **args)
      @from = from
      @to = to
      super
    end

    def validate(input)
      return false unless @from.nil? || input >= @from
      return false unless @to.nil? || input <= @to
      super
    end

    def self.default(value=nil, from: nil, to: nil)
      new(
        default: value,
        from: from,
        to: to
      )
    end

    def self.strict(from: nil, to: nil)
      new(
        required: true,
        from: from,
        to: to
      )
    end
  end
end
