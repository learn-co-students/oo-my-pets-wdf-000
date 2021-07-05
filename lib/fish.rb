class Fish
  attr_accessor :mood
  attr_reader :name

  def initialize(name)
    @name = ""
    self.name = name
    self.mood = "nervous"
  end

  def name=(new_name)
    if @name == ""
      @name = new_name
    else
      raise_error
    end
  end

end
