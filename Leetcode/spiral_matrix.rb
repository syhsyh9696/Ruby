# encoding:utf-8
# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
    return [] if matrix.empty?
    
    
    m = matrix[0].size; n = matrix.size; result = []
    max = m > n ? m : n; min = m > n ? n : m
    times = min / 2 + min % 2
    1.upto(times) do |time|
        result += _insert_(matrix, time)
    end
    
    result
end

private def _insert_(matrix, time)
    array = []; m = matrix[0].size; n = matrix.size

    row_range = ((0 + time - 1)..(m - 1 - time + 1))
    line_range = ((0 + time - 1)..(n - 1 - time + 1))

    if row_range.to_a.size > 1 && line_range.to_a.size > 1
        row_range.each { |x| array << matrix[line_range.first][x] }
        (line_range.first + 1).upto(line_range.last - 1).each { |x| array << matrix[x][row_range.last] }
        (row_range.last).downto(row_range.first).each { |x| array << matrix[line_range.last][x] }
        (line_range.last - 1).downto(line_range.first + 1).each { |x| array << matrix[x][row_range.first] }
    else
        line_range.each { |x| array << matrix[x][row_range.first] } if row_range.to_a.size == 1
        row_range.each { |x| array << matrix[line_range.first][x] } if line_range.to_a.size == 1
        array.pop if row_range.to_a.size == 1 && line_range.to_a.size == 1
    end
    
    array
end

def spiral_order_other(matrix)
    return matrix.flatten if matrix.size < 2 || matrix[0].size < 2
end
