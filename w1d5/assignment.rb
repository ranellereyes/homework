class Stack
  attr_accessor :stack

  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    @stack
  end
end

class Queue
  attr_accessor :queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue
  end
end

class Map
  attr_accessor :map

  def initialize
    @map = []
  end

  def assign(k, v)
    index = keys.index(k)
    index ? @map[index] = [k, v] : @map.push([k, v])
  end

  def lookup(k)

  end

  def remove(k)

  end

  def show
    @map
  end

  def keys
    @map.map { |(k, v)| k }
  end
end
