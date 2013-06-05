require "visualcaptcha/version"
require "visualcaptcha/engine"

module VisualCaptcha
  autoload :ViewHelper, 'visualcaptcha/view'
  autoload :ControllerHelpers, 'visualcaptcha/controller'
  autoload :Utils, 'visualcaptcha/utils'

  def self.setup
    yield self
  end

  class Option

    attr_accessor :id, :image, :title, :encrypted

    def initialize(id, image, title)
      @id = id
      @image = image
      @title = title
      @encrypted = VisualCaptcha::Utils.generate_key(id)
    end

  end

  class Challenge
    attr_accessor :answer, :options

    def initialize(answer, options=nil)
      @answer = answer
      @options = options
      @options << answer
      @options.shuffle!
    end
  end

  class Captcha

    attr_accessor :number

    def initialize(number=4)
      @number = number
      @answers = [
          Option.new('airplane', 'airplane.png', 'Airplane'),
          Option.new('balloons', 'balloons.png', 'Balloons'),
          Option.new('camera', 'camera.png', 'Camera'),
          Option.new('car', 'car.png', 'Car'),
          Option.new('cat', 'cat.png', 'Cat'),
          Option.new('chair', 'chair.png', 'Chair'),
          Option.new('clip', 'clip.png', 'Clip'),
          Option.new('clock', 'clock.png', 'Clock'),
          Option.new('cloud', 'cloud.png', 'Cloud'),
          Option.new('computer', 'computer.png', 'Computer'),
          Option.new('envelope', 'envelope.png', 'Envelope'),
          Option.new('eye', 'eye.png', 'Eye'),
          Option.new('flag', 'flag.png', 'Flag'),
          Option.new('folder', 'folder.png', 'Folder'),
          Option.new('foot', 'foot.png', 'Foot'),
          Option.new('graph', 'graph.png', 'Graph'),
          Option.new('house', 'house.png', 'House'),
          Option.new('key', 'key.png', 'Key'),
          Option.new('lamp', 'lamp.png', 'Lamp'),
          Option.new('leaf', 'leaf.png', 'Leaf'),
          Option.new('lock', 'lock.png', 'Lock'),
          Option.new('magnifying-glass', 'magnifying-glass.png', 'Magnifying Glass'),
          Option.new('man', 'man.png', 'Man'),
          Option.new('music-note', 'music-note.png', 'Music Note'),
          Option.new('pants', 'pants.png', 'Pants'),
          Option.new('pencil', 'pencil.png', 'Pencil'),
          Option.new('printer', 'printer.png', 'Printer'),
          Option.new('robot', 'robot.png', 'Robot'),
          Option.new('scissors', 'scissors.png', 'Scissors'),
          Option.new('sunglasses', 'sunglasses.png', 'Sunglasses'),
          Option.new('tag', 'tag.png', 'Tag'),
          Option.new('tree', 'tree.png', 'Tree'),
          Option.new('truck', 'truck.png', 'Truck'),
          Option.new('tshirt', 'tshirt.png', 'T-Shirt'),
          Option.new('umbrella', 'umbrella.png', 'Umbrella'),
          Option.new('woman', 'woman.png', 'Woman'),
          Option.new('world', 'world.png', 'World')
      ]

      #@$this->answers = array(
      #    'tshirt'   => array(self::$imagesPath . 'tshirt.png',   'T-Shirt'),
      #    'umbrella' => array(self::$imagesPath . 'umbrella.png', 'Umbrella'),
      #    'woman'	=> array(self::$imagesPath . 'woman.png',	'Woman'),
      #    'world'	=> array(self::$imagesPath . 'world.png',	'World'),
      #);
    end

    def build
      #shuffle the options
      opts = @answers.shuffle

      #pick a random answer
      answer = opts.sample
      opts.reject! { |c| c.id == answer.id }
      others = []

      #pick the remaining clues
      (1..@number-1).to_a.each_with_index do |c,i|

        possible = opts.sample
        others << possible
        opts.reject! { |c| c.id == possible.id }
      end
      #return the challenge
      Challenge.new(answer,others)
    end
  end
end
