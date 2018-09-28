class BottleNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def successor
    if number == 0
      return BottleNumber.new(99)
    else
      return BottleNumber.new(number-1)
    end
  end

  def action
    if number == 0
      "Go to the store and buy some more, "
    else
      "Take #{pronoun} down and pass it around, "
    end
  end

  def quantity
    if number == 0
      "no more"
    else
      number.to_s
    end
  end

  def pronoun
    if number == 1
      "it"
    else
      "one"
    end
  end

  def beer_units
    if number == 1
      "bottle"
    else
      "bottles"
    end
  end
end

class Bottles
  def song
    verses(99, 0)
  end

  def verses(starting, ending)
    starting.downto(ending).collect {|i| verse(i)}.join("\n")
  end

  def verse(number)
    bottle_number = BottleNumber.new(number)
    next_bottle_number = bottle_number.successor

    "#{bottle_number.quantity.capitalize} #{bottle_number.beer_units} of beer on the wall, " +
    "#{bottle_number.quantity} #{bottle_number.beer_units} of beer.\n" +
    bottle_number.action +
    "#{next_bottle_number.quantity} #{next_bottle_number.beer_units} of beer on the wall.\n"
  end
end
