# frozen_string_literal: true

class Trebuchet
  attr_reader :calibration_lines

  def initialize(input)
    @calibration_input = input.split("\n")
  end

  def calibrate
    calibration_sum = 0
    @calibration_input.each do |line|
      calibration_sum += line_calibration_value(line.strip)
    end
    calibration_sum
  end

  def line_calibration_value(line)
    first_digit = nil
    last_digit = nil
    line.split('').each do |char|
      if Integer(char, exception: false)
        first_digit ||= char
        last_digit = char
      end
    end

    (first_digit + last_digit).to_i
  end

  ## Part 2
  NUMBER_WORD_HASH = {
    'one' => '1',
    'two' => '2',
    'three' => '3',
    'four' => '4',
    'five' => '5',
    'six' => '6',
    'seven' => '7',
    'eight' => '8',
    'nine' => '9'
  }.freeze

  def calibrate_pt2
    calibration_sum = 0
    @calibration_input.each do |line|
      calibration_sum += process_line(line)
    end
    calibration_sum
  end

  # def process_line(line)
  #   first_digit = nil
  #   last_digit = nil
  #   current_string = ''
  #   line.split('').each do |char|
  #     if Integer(char, exception: false)
  #       first_digit ||= char
  #       last_digit = char
  #       current_string = ''
  #     else
  #       current_string += char
  #       if current_string.length >= 3
  #         first_digit ||= find_first_n(current_string)
  #         last_digit = find_last_n(current_string) if find_last_n(current_string)
  #         current_string = current_string[1..]
  #       end
  #     end
  #   end
  #   (first_digit + last_digit).to_i
  # end

  def process_line(line)
    nums_found = ''
    char_array = line.split('')
    (0..char_array.size).each do |i|
      if Integer(char_array[i], exception: false)
        nums_found += char_array[i]
      elsif char_array[i..i + 2].join == 'one'
        nums_found += '1'
      elsif char_array[i..i + 2].join == 'two'
        nums_found += '2'
      elsif char_array[i..i + 4].join == 'three'
        nums_found += '3'
      elsif char_array[i..i + 3].join == 'four'
        nums_found += '4'
      elsif char_array[i..i + 3].join == 'five'
        nums_found += '5'
      elsif char_array[i..i + 2].join == 'six'
        nums_found += '6'
      elsif char_array[i..i + 4].join == 'seven'
        nums_found += '7'
      elsif char_array[i..i + 4].join == 'eight'
        nums_found += '8'
      elsif char_array[i..i + 3].join == 'nine'
        nums_found += '9'
      end
    end

    (nums_found[0] + nums_found[nums_found.size - 1]).to_i
  end

  # def find_first_n(string)
  #   first_n = nil
  #   NUMBER_WORD_HASH.each_key do |number_key|
  #     if string.include?(number_key)
  #       first_n ||= number_key
  #       if string.index(number_key) < string.index(first_n)
  #         first_n = number_key
  #       end
  #     end
  #   end
  #   NUMBER_WORD_HASH[first_n]
  # end

  # def find_last_n(string)
  #   last_n = nil
  #   NUMBER_WORD_HASH.each_key do |number_key|
  #     if string.include?(number_key)
  #       if last_n.nil?
  #         last_n = number_key
  #       elsif string.index(number_key) > string.index(last_n)
  #         last_n = number_key
  #       end
  #     end
  #   end
  #   NUMBER_WORD_HASH[last_n]
  # end
end
