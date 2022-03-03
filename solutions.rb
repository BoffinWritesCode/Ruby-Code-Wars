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
    # for each interval
	intervals.each { |arr| 
        # get the range
		range = arr[0]..arr[1]
        # calculate any overlaps, by selecting ranges which overlap with this range
		overlaps = ranges.select{ |r| !(r.first > range.last || r.last < range.first) }
        # if any overlaps
		if overlaps.length > 0 then
            # remove the overlaps from the list of ranges
			ranges -= overlaps
            # get the new range, based on the overlap
			overlaps.push(range)
			min = overlaps.map(&:first).min
			max = overlaps.map(&:last).max
			range = min..max
		end
        # push the range
        ranges.push(range)
	}
    # get the sum of all ranges
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
		current = row[i]
		next = row[i + 1]
		row[i] = current == next ? current : get_next(current, next)
	}
	next_row(row, length - 1)
end

# horrid function, but gets the correct letter based on a's value and b's value
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
	morseCode.strip.split('   ').map { |word|
		word.split(' ').map { |morse_seq| MORSE_CODE[morse_seq] }.join
	}.join(' ')
end

# https://www.codewars.com/kata/52742f58faf5485cae000b9a 
# 4 kyu challenge
# -----------------------------------------------------------------

def format_duration(seconds)
    return "now" if seconds == 0
    
    components = { 
      "year" => (seconds / 31536000).floor,
      "day" => (seconds / 86400).floor % 365,
      "hour" => (seconds / 3600).floor % 24,
      "minute" => (seconds / 60).floor % 60,
      "second" => seconds % 60 
    }
    
    final = []
    prev = false
    
    components.each { |k, v|
      next if v <= 0
      final.push(v.to_s + " " + k + (v > 1 ? "s" : ""))
    }
    
    result = ""
    
    final.each.with_index { |f, i| 
      preValue = i > 0 ? (i == final.length - 1 ? " and " : ", ") : ""
      result += preValue + f
    }
    
    result
end

# https://www.codewars.com/kata/529bf0e9bdf7657179000008
# 4 kyu challenge
# -----------------------------------------------------------------

def validSolution(board)
    #check rows
    board.each { |row| return false if row.uniq.length != row.length || row.index(0) }

    #check columns and add to grids
    grids = [[], [], [], [], [], [], [], [], []]
    9.times { |x|
        column = []
        9.times { |y|
            return false if board[y][x] == 0
            
            column.push(board[y][x])
            
            grid_index = (y / 3).floor * 3 + (x / 3).floor
            grids[grid_index].push(board[y][x])
        }
        return false if column.uniq.length != column.length
    }
    grids.each { |grid| return false if grid.uniq.length != grid.length }
    true
end

# https://www.codewars.com/kata/51c8e37cee245da6b40000bd
# 4 kyu challenge
# -----------------------------------------------------------------

def solution(input, markers)
    input.split("\n").map { |line| line.gsub(/[#{markers.join}].*/, '').strip }.join("\n")
end

# https://www.codewars.com/kata/55983863da40caa2c900004e
# 4 kyu challenge
# -----------------------------------------------------------------

def next_bigger(n)
    current = []
    done = false
    n.to_s.chars.reverse.each { |c| 
        current.prepend(c.to_i)
        next if done || current.sort.reverse == current
        currentMapped = current.map(&:to_s)
        permutations = currentMapped.permutation.map(&:join).map(&:to_i).uniq.sort
        curValue = currentMapped.join.to_i
        current = permutations.fetch(permutations.index(curValue) + 1, curValue).to_s.split('').map(&:to_i)
        done = true
    }
    value = current.join.to_i
    value == n ? -1 : value
end

# https://www.codewars.com/kata/5235c913397cbf2508000048
# this is now retired, but I believe it was 3 kyu when I first attempted it months ago.
# -----------------------------------------------------------------

class Calculator
    def evaluate(string)
        # get the infix string in postfix form, as an array of values to loop through
        postfix = convertToPostfix(string)
        stack = []
        # for each value in the postfix array
        postfix.each { |c| 
        # if it's a number, push to stack
        if c.match?(/[[:digit:]]/)
            stack.push(c.to_i)
        else 
            # otherwise, pop last two values from the stack and do calculation on them
            # then push that value back onto the stack
            a = stack.pop().to_f
            b = stack.pop().to_f
            case c
            when "+"
                stack.push(b + a)
            when "-"
                stack.push(b - a)
            when "*"
                stack.push(b * a)
            when "/"
                stack.push(b / a)
            end
        end
        }
        return stack.pop()
    end
    
    def convertToPostfix(infixExpression)
        # implemention based on pseudocode from: 
        # https://www.tutorialspoint.com/Convert-Infix-to-Postfix-Expression
        stack = ['@']
        parts = infixExpression.split
        postfix = []
        parts.each { |c|
            if c.match?(/[[:digit:]]/)
                postfix.push(c)
            elsif c == '('
                stack.push('(')
            elsif c == ')'
                while stack[-1] != '@' and stack[-1] != '(' do
                    postfix.push(stack.pop())
                end
                stack.pop()
            else
                while stack[-1] != '@' and operatorPrecedence(c) <= operatorPrecedence(stack[-1]) do
                    postfix.push(stack.pop())
                end
                
                stack.push(c)
            end
        }
        while stack[-1] != '@' do
            postfix.push(stack.pop())
        end
        return postfix
    end
      
    def operatorPrecedence(op)
        case op
        when "+", "-"
            1
        when "*", "/"
            2
        else
            0
        end
    end
end