class Daylist

  attr_reader :entries

  def initialize(entries)
    @entries = entries.sort_by { |entry| entry.come}
  end

  def calc_break
    difference = 0

    @entries.each.with_index do |entry, i|
      difference += @entries[i+1].come - @entries[i].gone unless entry == @entries.last
    end

    difference
  end

  def spend_time
    secs = 0
    @entries.each do |entry| 
      secs += entry.gone - entry.come
    end
    secs
  end
end