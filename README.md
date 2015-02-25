# Color Fun

This gem provides a few useful methods associated with colors for use in
web-based applications. This was all written for a little app we're working on.

## Example Usage

```ruby
# Initializing colors
red   = ColorFun::RGB.new(255,0,0)         # =>  #<ColorFun::RGB:0x007f9 @red=255, @green=0, @blue=0>
red   = ColorFun::RGB.from_hex('ff0000')   # =>  #<ColorFun::RGB:0x007f9 @red=255, @green=0, @blue=0>

# Access colors
red.red                                 # => 255
red.green                               # => 0
red.blue                                # => 0

# Return perceived brightness of the colors
red.perceived_brightness                # => 139.43627576782163
red.dark?                               # => true
red.light?                              # => false

# Return a lighter/darker version of the color. Accepts (optionally) a percentage.
red.lighter                             # => #<ColorFun::RGB:0x007fa @red=255, @green=127, @blue=127>
red.lighter(75)                         # => #<ColorFun::RGB:0x007fa @red=255, @green=191, @blue=191>
red.darker                              # => #<ColorFun::RGB:0x007fa @red=127, @green=0, @blue=0>
red.darker(25)                          # => #<ColorFun::RGB:0x007fa @red=191, @green=0, @blue=0>

# Return a hex value for the color
red.hex                                 # => 'ff0000'

# Return an HSL object for the color
red.hsl                                 # => #<ColorFun::HSL:0x007fa @hue=0.0, @saturation=100.0, @lightness=100.0>
red.hsl.hue                             # => 0.0
red.hsl.saturation                      # => 100.0
red.hsl.lightness                       # => 100.0
red.hsl.name                            # => 'Red'

# Quick access to key colors
red     = ColorFun::RGB.red
green   = ColorFun::RGB.green
blue    = ColorFun::RGB.blue
```

## Gradients

Another cool little feature in here is the ability to work with gradients. This will automatically
create a linear gradient between colours you provide.

### Example usage with gradientds

```ruby
gradient              = ColorFun::Gradient.new('e10025', '00a5e2', '7ae100')

# Optionally, set the resolution for the gradient (default is 100)
gradient.resolution   = 100

# Get the colour of the gradient at a specific point
gradient.at(50)      # => #<ColorFun::RGB:0x007fb @red=0, @green=165, @blue=226>
gradient.at(25)      # => #<ColorFun::RGB:0x007fb @red=112, @green=82, @blue=131>
gradient.at(100)     # => #<ColorFun::RGB:0x007fb @red=122, @green=225, @blue=0>
gradient.at(0)       # => #<ColorFun::RGB:0x007fb @red=225, @green=0, @blue=37>

# Return all the points for each part of the gradient
gradient.points      # => Array of all points as if you called the at method on each
```
