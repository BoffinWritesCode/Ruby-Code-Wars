# https://www.codewars.com/kata/52c4dd683bfd3b434c000292
# 4 kyu challenge, getting interesting numbers for a car's mileage.
def get_interesting(number, awesome_phrases)
    num_s = number.to_s
    chars = num_s.chars
    
    return 0 if number < 100
    
    # a digit followed by zeroes
    return 2 if chars.count("0") == chars.length - 1
    
    #all same
    return 2 if chars.uniq.length <= 1
    
    #all sequential incrementing
    return 2 if chars.select.with_index { |c, i| i == 0 || chars[i].to_i == (chars[i-1].to_i + 1) % 10 }.length == chars.length
    
    #all sequential decrementing
    return 2 if chars.select.with_index { |c, i| i == 0 || chars[i].to_i == chars[i-1].to_i - 1 }.length == chars.length
    
    #palindromic
    return 2 if num_s.reverse == num_s
    
    #in phrases
    return 2 if awesome_phrases.include?(number)
    
    0
end
  
def is_interesting(number, awesome_phrases)
    if get_interesting(number, awesome_phrases) == 2
        return 2
    elsif get_interesting(number + 1, awesome_phrases) == 2 || get_interesting(number + 2, awesome_phrases) == 2
        return 1
    end
    0
end