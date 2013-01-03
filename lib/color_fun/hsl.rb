module ColorFun
  class HSL
    
    attr_accessor :hue, :saturation, :lightness
    
    def initialize(h, s, l)
      @hue, @saturation, @lightness = h, s, l
    end
    
    # Return a name for this colour
    def name
      Array.new.tap do |s|
        if @saturation == 0 && @lightness == 0
          s << "Black"
        elsif @saturation == 0 && @lightness == 100
          s << "White"
        elsif @saturation <= 15 && @saturation > 0
          s << "Light"
        elsif @lightness < 40 && @saturation > 0
          s << "Dark"
        end
        
        if @saturation > 0
          s << case @hue
          when 0..8, 347..360 then 'Red'
          when 9..42          then 'Orange'
          when 43..61         then 'Yellow'
          when 62..158        then 'Green'
          when 159..264       then 'Blue'
          when 265..285       then 'Purple'
          when 286..346       then 'Pink'
          end
        else
          s << "Grey"
        end
      end.join(' ')
    end
    
    # Create a new HSL object based on the RGB values
    def self.from_rbg(r,g,b)
      colors    = [r / 255.0, g / 255.0, b / 255.0]
      max       = colors.max
      min       = colors.min
      d         = max - min
      v         = max * 100

      s = max != 0.0 ? d / max *100 : 0.0

      if s == 0.0
        h = 0.0
      else
        case max
        when colors[0]
          h = (colors[1] - colors[2]) / d
        when colors[1]
          h = 2 + (colors[2] - colors[0]) / d
        when colors[2]
          h = 4 + (colors[0] - colors[1]) / d
        end
        h *= 60.0
        h += 360.0 if (h < 0)
      end
      self.new(h, s, v)
    end
    
  end
end
