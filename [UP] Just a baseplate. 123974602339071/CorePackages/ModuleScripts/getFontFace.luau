-- Path: CorePackages.Packages._Index.InlineLayout.InlineLayout.Utils.getFontFace
return function(p1) -- name: getFontFace
	if p1 then
		p1 = p1.Font
	end
	if typeof(p1) == "EnumItem" and p1:IsA("Font") then
		return Font.fromEnum(p1)
	else
		return p1
	end
end