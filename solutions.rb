# https://www.codewars.com/kata/52c4dd683bfd3b434c000292
# 4 kyu challenge
# -----------------------------------------------------------------

def get_interesting(number, awesome_phrases)
	num_s = number.to_s
	chars = num_s.chars
		return false if number < 100
		# a digit followed by zeroes
	return true if chars.count("0") == chars.length - 1
		#all same
	return true if chars.uniq.length <= 1
		#all sequential incrementing
	return true if chars.select.with_index { |c, i| i == 0 || chars[i].to_i == (chars[i-1].to_i + 1) % 10 }.length == chars.length
		#all sequential decrementing
	return true if chars.select.with_index { |c, i| i == 0 || chars[i].to_i == chars[i-1].to_i - 1 }.length == chars.length
		#palindromic
	return true if num_s.reverse == num_s
		#in phrases
	return true if awesome_phrases.include?(number)
		false
end

def is_interesting(number, awesome_phrases)
	if get_interesting(number, awesome_phrases)
		return 2
	elsif get_interesting(number + 1, awesome_phrases) || get_interesting(number + 2, awesome_phrases)
		return 1
	end
	0
end

# https://www.codewars.com/kata/52b7ed099cdc285c300001cd
# 4 kyu challenge
# -----------------------------------------------------------------

def sum_of_intervals(intervals)
	ranges = []
	intervals.each { |arr| 
		range = arr[0]..arr[1]
		overlaps = ranges.select{ |r| !(r.first > range.last || r.last < range.first) }
		if overlaps.length > 0 then
			ranges -= overlaps
			overlaps.push(range)
			min = overlaps.map(&:first).min
			max = overlaps.map(&:last).max
			range = min..max
		end
				ranges.push(range)
	}
		ranges.sum { |r| r.last - r.first }
end

# https://www.codewars.com/kata/5a25ac6ac5e284cfbe000111
# 7 kyu challenge
# -----------------------------------------------------------------

def triangle(row)
	next_row(row, row.length)
end

def next_row(row, length)
	return row[0] if length == 1
		length.times { |i| 
		crt = row[i]
		nxt = row[i + 1]
		row[i] = crt == nxt ? crt : get_next(crt, nxt)
	}
	next_row(row, length - 1)
end

def get_next(a, b)
	case a
	when "R"
		case b
		when "G"
			"B"
		else
			"G"
		end
	when "G"
		case b
		when "B"
			"R"
		else
			"B"
		end
	when "B"
		case b
		when "R"
			"G"
		else
			"R"
		end
	end
end

# https://www.codewars.com/kata/54b72c16cd7f5154e9000457
# 4 kyu challenge
# -----------------------------------------------------------------
# preloaded: MORSE_CODE

def decodeBits(bits)
	print bits
	sections = bits.scan(/0+|1+/)
	rate = sections.select.with_index{ |k, i| k[0] == "0" ? i > 0 && i < sections.length - 1 : true }.map(&:length).min
	sections.map { |sec|
		parts = (sec.length / rate).floor
		case sec[0]
		when "1"
			case parts
			when 1
				"."
			when 3
				"-"
			end
		else
			case parts
			when 3
				" "
			when 7
				"   "
			end
		end
	}.join
end

def decodeMorse(morseCode)
	print morseCode
	morseCode.strip.split('   ').map { |word|
		word.split(' ').map { |morse_seq| MORSE_CODE[morse_seq] }.join
	}.join(' ')
end

# https://www.codewars.com/kata/54b724efac3d5402db00065e
# 6 kyu challenge
# -----------------------------------------------------------------

def decodeMorse(morseCode)
	#your brilliant code here
	morseCode.strip.split('   ').map { |word|
		word.split(' ').map { |morse_seq| MORSE_CODE[morse_seq] }.join
	}.join(' ')
end

# https://www.codewars.com/kata/52742f58faf5485cae000b9a 
# 4 kyu challenge
# -----------------------------------------------------------------
