# encoding: utf-8
# @param {Integer[]} height
# @return {Integer}
def max_area(height)
    start, finish = 0, height.size - 1
    max_area = 0
    while (start < finish)
        max_area = max(max_area, min(height[start], height[finish]) * (finish - start))
        (height[start] > height[finish]) ? finish = finish - 1 : start = start + 1       
    end
    max_area
end

private def max(a, b)
    return a if a > b
    return b if a <= b
end

private def min(a, b)
    return a if a <= b
    return b if a > b
end
