-- Path: CorePackages.Packages._Index.FocusNavigation.FocusNavigation.isValidFocusTarget
return function(p1) -- name: isValidFocusTarget
	if p1 then
		if p1:IsA("GuiBase2d") then
			if p1:FindFirstAncestorWhichIsA("LayerCollector") then
				if p1:FindFirstAncestorWhichIsA("BasePlayerGui") then
					return true
				else
					return false, "provided Instance is not a descendant of a BasePlayerGui like PlayerGui or CoreGui"
				end
			else
				return false, "provided Instance is not a descendant of a LayerCollector like a ScreenGui or SurfaceGui"
			end
		else
			return false, string.format("provided Instance is of class %s, which is not a GuiBase2d", p1.ClassName)
		end
	else
		return false, "`nil` value provided to isValidFocusTarget"
	end
end