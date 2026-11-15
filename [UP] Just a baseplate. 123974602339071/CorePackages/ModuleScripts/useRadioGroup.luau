-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.RadioGroup.useRadioGroup
local v1 = script:FindFirstAncestor("Foundation").Parent
local v_u_2 = require(v1.React)
local v_u_3 = require(script.Parent.RadioGroupContext)
return function()
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	return v_u_2.useContext(v_u_3)
end