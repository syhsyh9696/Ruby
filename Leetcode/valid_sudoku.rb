# encoding:utf-8
# @param {Character[][]} board
# @return {Boolean}

def is_valid_sudoku(board)
    rowbucket = Array.new(9) { Hash.new }
    colbucket = Array.new(9) { Hash.new }
    sqrbucket = Array.new(9) { Hash.new }

    0.upto(8) do |i|
        0.upto(8) do |j|
            element = board[i][j]
            next if element == ".k"

            return false if rowbucket[i][element]
            rowbucket[i][element] = true

            return false if colbucket[j][element]
            colbucket[j][element] = true

            k = (i / 3) * 3 + (j / 3) 
            return false if sqrbucket[k][element]
            sqrbucket[k][element] = true
            
        end
    end
    return true
end
