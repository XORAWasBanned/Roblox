-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.ColorPicker.createBrickColorsFromIds
return function(p1) -- name: createBrickColorsFromIds
	local v2 = {}
	for _, v3 in p1 do
		local v4 = BrickColor.new
		local v5, v6 = pcall(v4, v3)
		if v5 and v6 then
			table.insert(v2, v6)
		else
			warn((("createBrickColorsFromIds: Failed to create BrickColor with ID %*"):format(v3)))
		end
	end
	return v2
end