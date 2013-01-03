module ColorFun
  class Gradient
    
    attr_accessor :resolution
    
    def initialize(*colors)
      @colors = colors
      @resolution = 100
    end
    
    def colors
      @colors.map do |color|
        color.scan(/../).map { |c| c.to_i(16) }
      end
    end
    
    def differences
      colors[0..-2].each_with_index.map do |color, i|
        color.dup.each_with_index.map { |c, j| colors[i + 1][j] - c }
      end
    end
    
    def color_window_size
      @resolution / differences.size
    end
    
    def points
      @resolution.times.map { |i| self.at(i) }
    end
    
    def at(point)
      window = point / color_window_size

      if point == @resolution
        difference = differences.last
        position = color_window_size
        window = differences.size - 1
      else
        difference = differences[window]
        position = point % color_window_size
      end

      new_colors = difference.each_with_index.map do |dc, i|
        (colors[window][i] + (dc * (position.to_f / color_window_size.to_f))).to_i
      end
      
      ColorFun::RGB.new(*new_colors)
    end
    
  end
end
