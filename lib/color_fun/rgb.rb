module ColorFun
  class RGB

    # Accessors for accessing the individual colors
    attr_accessor :red, :green, :blue

    # Initialize by passinga red, green and blue hex code
    def initialize(red, green, blue)
      @red, @green, @blue = red.to_i, green.to_i, blue.to_i
    end

    # Return the brightness value for a given colour (HSP)
    def perceived_brightness
      @brightness ||= Math.sqrt((0.299 * @red * @red) + (0.587 * @green * @green) + (0.114 * @blue * @blue))
    end

    # Return whether or not the color is visibly dark to the human eye?
    def dark?
      perceived_brightness <= 160
    end

    # Return whether or not the color is visibly light to the human eye?
    def light?
      !dark?
    end

    # Return a new color object for a lighter version of this color
    def lighter(percent = 50)
      percent = (percent / 100.0)
      RGB.new((255 - @red) * percent + @red, (255 - @green) * percent + @green, (255 - @blue) * percent + @blue)
    end

    # Return a new color object for a darker version of this color
    def darker(percent = 50)
      percent = ((100 - percent) / 100.0)
      RGB.new(@red * percent, @green * percent, @blue * percent)
    end

    # Return a hex string for this color
    def hex
      [@red, @green, @blue].map do |c|
        c.to_s(16).rjust(2, '0')
      end.join
    end

    # Return a HSL version of this color
    def hsl
      @hsl ||= HSL.from_rbg(@red, @green, @blue)
    end

    # Initialize a new color object for a given hex code
    def self.from_hex(hex)
      self.new(*hex.scan(/../).map { |i| i.to_i(16) })
    end

    # Methods to create raw red, green and blue colors
    def self.red; self.new(255,0,0); end
    def self.green; self.new(0,255,0); end
    def self.blue; self.new(0,0,255); end

  end
end
