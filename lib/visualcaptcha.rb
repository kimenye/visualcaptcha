require "visualcaptcha/version"
require "visualcaptcha/engine"

module VisualCaptcha
  autoload :ViewHelper, 'visualcaptcha/view'
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
          Option.new('graph', 'graph.png', 'House')
      ]

      #@$this->answers = array(
      #    'airplane' => array(self::$imagesPath . 'airplane.png', 'Airplane'),
      #    'balloons' => array(self::$imagesPath . 'balloons.png', 'Balloons'),
      #    'camera'   => array(self::$imagesPath . 'camera.png',   'Camera'),
      #    'car'	  => array(self::$imagesPath . 'car.png',	  'Car'),
      #    'cat'	  => array(self::$imagesPath . 'cat.png',	  'Cat'),
      #    'chair'	=> array(self::$imagesPath . 'chair.png',	'Chair'),
      #    'clip'	 => array(self::$imagesPath . 'clip.png',	 'Clip'),
      #    'clock'	=> array(self::$imagesPath . 'clock.png',	'Clock'),
      #    'cloud'	=> array(self::$imagesPath . 'cloud.png',	'Cloud'),
      #    'computer' => array(self::$imagesPath . 'computer.png', 'Computer'),
      #    'envelope' => array(self::$imagesPath . 'envelope.png', 'Envelope'),
      #    'eye'	  => array(self::$imagesPath . 'eye.png',	  'Eye'),
      #    'flag'	 => array(self::$imagesPath . 'flag.png',	 'Flag'),
      #    'folder'   => array(self::$imagesPath . 'folder.png',   'Folder'),
      #    'foot'	 => array(self::$imagesPath . 'foot.png',	 'Foot'),
      #    'graph'	=> array(self::$imagesPath . 'graph.png',	'Graph'),
      #    'house'	=> array(self::$imagesPath . 'house.png',	'House'),
      #    'key'	  => array(self::$imagesPath . 'key.png',	  'Key'),
      #    'lamp'	 => array(self::$imagesPath . 'lamp.png',	 'Lamp'),
      #    'leaf'	 => array(self::$imagesPath . 'leaf.png',	 'Leaf'),
      #    'lock'	 => array(self::$imagesPath . 'lock.png',	 'Lock'),
      #    'magnifying-glass' => array(self::$imagesPath . 'magnifying-glass.png', 'Magnifying Glass'),
      #    'man'	  => array(self::$imagesPath . 'man.png',	  'Man'),
      #    'music-note' => array(self::$imagesPath . 'music-note.png', 'Music Note'),
      #    'pants'	=> array(self::$imagesPath . 'pants.png',	'Pants'),
      #    'pencil'   => array(self::$imagesPath . 'pencil.png',   'Pencil'),
      #    'printer'  => array(self::$imagesPath . 'printer.png',  'Printer'),
      #    'robot'	=> array(self::$imagesPath . 'robot.png',	'Robot'),
      #    'scissors' => array(self::$imagesPath . 'scissors.png', 'Scissors'),
      #    'sunglasses' => array(self::$imagesPath . 'sunglasses.png', 'Sunglasses'),
      #    'tag'	  => array(self::$imagesPath . 'tag.png',	  'Tag'),
      #    'tree'	 => array(self::$imagesPath . 'tree.png',	 'Tree'),
      #    'truck'	=> array(self::$imagesPath . 'truck.png',	'Truck'),
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
