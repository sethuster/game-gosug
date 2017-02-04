require 'gosu'
def media_path(file)
  File.join(File.dirname(File.dirname(__FILE__)), 'media', file)
end

class Spaceship
  SPRITE = media_path('Spaceship_1.png')

  def initialize(window,x,y)
    @x, @y = x, y
    @draws = 0
    @buttons_down = 0
    @window = window
    @sprite = Gosu::Image.new(window, SPRITE, false)
  end

  def update
    @x -= 5 if @window.button_down?(Gosu::KbLeft)
    @x += 5 if @window.button_down?(Gosu::KbRight)
    @y -= 5 if @window.button_down?(Gosu::KbUp)
    @y += 5 if @window.button_down?(Gosu::KbDown)
  end

  def button_down(id)
    @window.close if id == Gosu::KbEscape
    @buttons_down += 1
  end

  def button_up(id)
    @buttons_down -= 1
  end

  def needs_redraw?
    @draws == 0 || @buttons_down > 0
  end

  def draw
    @draws += 1
    @sprite.draw(@x,@y,0)
  end
end


class GameWindow < Gosu::Window
  def initialize
    super(800,600,FALSE)
    self.caption = "Sprite Test"
    @ship = Spaceship.new(self,100,100)
  end

  def update
    @ship.update
  end

  def button_down(id)
    @ship.button_down(id)
  end

  def button_up(id)
    @ship.button_up(id)
  end

  def draw
    @ship.draw
  end

end

window = GameWindow.new
window.show
