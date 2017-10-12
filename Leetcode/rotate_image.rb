# encoding:utf-8
# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate(matrix)
    0.upto(matrix.size - 1) do |i|
        i.upto(matrix.size - 1) do |j|
            matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
        end
    end

    matrix.map(&:reverse!)
end
