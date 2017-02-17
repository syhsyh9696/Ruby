# encoding: utf-8

# @param {String} s
# @param {Integer} num_rows
# @return {String}

def convert(s, num_rows)
    return s.dup if num_rows == 1 # String#dup duplicate

    newstr, cycle = '', 2 * num_rows - 2
    0.upto(num_row - 1) do |row|
        0.upto(s.size.fdiv(cycle).floor) do |rolling|
            base = rolling * cycle

            newstr << s[base + row].to_s
            newstr << s[base + cycle - row].to_s if row.between?(1, num_rows - 2)
        end
    end
    newstr
end
