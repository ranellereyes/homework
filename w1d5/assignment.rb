class Stack
  attr_accessor :stack

  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.push
    @stack
  end

  def show
    # return a copy of the stack
  end
end
