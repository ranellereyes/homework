def sluggish_octopus(strings)
  strings.each do |possible_sol|
    target = possible_sol.length
    return possible_sol if strings.all? { |string| target >=  string.length }
  end
end

def dominant_octopus(strings)
  ordered = strings.sort { |a, b| a.length <=> b.length }
  ordered.last
end

def clever_octopus(strings)
  res = nil
  strings.each { |string| res = string if res.nil? || string.length > res.length }
  res
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(dir, tiles_array)
  tiles_array.each_with_index { |tile, i| return i if tile == dir }
end

def fast_dance(dir, tiles_array)
  hash = Hash[tiles_array.zip((0...8).to_a)]
  hash[dir]
end
