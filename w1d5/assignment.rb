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
    find(k) ? @map[find(k)] = [k, v] : @map.push([k, v])
  end

  def lookup(k)
    find(k).nil? ? nil : @map[find(k)].last
  end

  def remove(k)
    find(k).nil? ? nil : @map.delete_at(find(k))
  end

  def show
    @map
  end

  private

  def find(k)
    keys.index(k)
  end

  def keys
    @map.map { |(k, v)| k }
  end
end
