class Daylist

  attr_reader :entries

  def initialize(entries)
    @entries = entries.sort_by { |entry| entry.come}
  end

  def calc_break
    difference = 0

    @entries.each.with_index do |entry, i|
      if(entry.gone && entry.come)
        difference += @entries[i+1].come - @entries[i].gone unless entry == @entries.last    
      end
    end

    secs_to_hours difference
  end

  def secs_to_hours (diff)
    hours = diff / 3600
    hours.round(2)
  end

  def spend_time
    secs = 0
    @entries.each do |entry| 
      if(entry.gone && entry.come)
        secs += entry.gone - entry.come
      end
    end
    secs_to_hours secs
  end
end