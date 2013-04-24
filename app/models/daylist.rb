class Daylist

  attr_reader :entries

  def initialize(entries)
    @entries = entries.sort_by { |entry| entry.come}
  end

  def calc_break
    difference = 0
    come_array = Array.new
    gone_array = Array.new

    @entries.each do |entry|
      come_array.push(entry.come)
      gone_array.push(entry.gone)  
    end

    i =  0
    while i < come_array.length - 1 do
      difference += come_array[i+1] - gone_array[i]
      i += 1
    end

    difference
  end

end