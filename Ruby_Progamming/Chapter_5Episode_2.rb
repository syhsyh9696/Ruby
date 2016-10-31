tag = [ "Sun Yuanhao", "Xu Hefeng", "Zhang Chunwang"]
tag.each do |tagname|
	case tagname
	when "Wang"
		p "Sun is in the tags"
	when "Wang boyang"
		p "Wang Boyang is in the tags"
	else
		p "Wang Boyang is not in the tags"
	end
end
		