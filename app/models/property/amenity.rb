class Property
  class Amenity
    attr_reader :label, :value

    def initialize label, value = false
      validate! label, value
      @label = label
      @value = value
    end

    alias_method :name, :label

    def on!
      @value = true
    end

    def off!
      @value = false
    end

    def on?
      state == 'on'
    end

    def off?
      !on?
    end

    def state
      value == true ? 'on' : 'off'
    end

    protected

    def validate! label, value
      validate_label! label
      unless boolean?(value)
        raise ArgumentError, "Must be a Boolean, was: #{value}"
      end
    end   

    def validate_label! label
      unless label? label
        raise ArgumentError, "Must be a label, was: #{label.inspect}"
      end
    end

    def label? label
      [String, Symbol].any?{|type| label.kind_of?(type) }
    end

    def boolean? value
      [true, false].include?(value)
    end
  end
end