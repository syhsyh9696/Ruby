array = [ "a", 1, nil]
array.each do |item|
	case item
	when String 
		p "item is a string"
	when Numeric
		p "item is a Numeric"
	else
		p "item is something"
	end
end
		