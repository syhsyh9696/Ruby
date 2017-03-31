# encoding:utf-8
# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.

def solve_sudoku(board)
    rowbuckets = Array.new(9) { Hash.new }
    colbuckets = Array.new(9) { Hash.new }
    boxbuckets = Array.new(9) { Hash.new }

    0.upto(80) do |num|
        i, j = num.divmod(9)
        next if board[i][j] == '.'

        k = (i / 3) * 3 + j / 3
        char = board[i][j]
        rowbuckets[i][char] = true
        colbuckets[j][char] = true
        boxbuckets[k][char] = true
    end

    _solve_sudoku_(board, 0, rowbuckets, colbuckets, boxbuckets)
    nil
end

private def _solve_sudoku_(board, num, rowbuckets, colbuckets, boxbuckets)
    while true
        i, j = num.divmod(9)
        if board[i][j] == '.'
            k = (i / 3) * 3 + (j / 3)
            r, c, b = rowbuckets[i], colbuckets[j], boxbuckets[k]
            break
        end

        num += 1
        return true if num == 81
    end

    '1'.upto('9').each do |n|
        next if r[n] || c[n] || b[n]
        
        board[i][j] = n
        r[n] = c[n] = b[n] = true

        ok = _solve_sudoku_(board, num, rowbuckets, colbuckets, boxbuckets)
        return true if ok

        r[n] = c[n] = b[n] = false
        board[i][j] = '.'
    end
    
    return false
end
