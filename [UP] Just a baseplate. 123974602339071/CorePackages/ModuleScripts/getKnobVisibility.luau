-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InternalSlider.getKnobVisibility
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.ControlState)
local v_u_3 = require(v1.Enums.Visibility)
return function(p4) -- name: getKnobVisibility
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	if p4.isDisabled then
		return false
	elseif p4.knobVisibility == v_u_3.None then
		return p4.isSelected
	else
		return p4.knobVisibility == v_u_3.Always and true or (p4.isDragging or p4.isSelected or (p4.controlState == v_u_2.Hover and true or p4.controlState == v_u_2.Pressed))
	end
end