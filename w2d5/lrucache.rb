class LRUCache
  attr_accessor :cache

  def initialize
    @cache = []
  end

  def count
    @cache.count
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
      @cache.push(el)
    else
      @cache.push(el)
      @cache.shift if count > 4
    end
  end

  def show
    p @cache
  end

  private
  # helper methods go here!

  end
