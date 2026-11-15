-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Interactable.getStateLayerStyle
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Providers.Style.Tokens)
require(v1.Components.Types)
local v_u_2 = require(v1.Enums.ColorNamespace)
local v_u_3 = require(v1.Enums.StateLayerMode)
local v_u_4 = require(v1.Enums.ControlState)
function guiStateToStateLayer(p5) -- name: guiStateToStateLayer
	-- upvalues: (copy) v_u_4
	return p5 == v_u_4.Pressed and "Press" or (p5 == v_u_4.SelectedPressed and "Press" or (p5 == v_u_4.Hover and "Hover" or "Idle"))
end
function stateLayerModeToTokenNamespace(p6) -- name: stateLayerModeToTokenNamespace
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	if p6 == v_u_3.Default then
		return v_u_2.Color
	elseif p6 == v_u_3.Inverse then
		return v_u_2.Inverse
	elseif p6 == v_u_3.Light then
		return v_u_2.LightMode
	elseif p6 == v_u_3.Dark then
		return v_u_2.DarkMode
	else
		return v_u_2.Color
	end
end
return function(p7, p8, p9) -- name: getStateLayerStyle
	local v10 = stateLayerModeToTokenNamespace(p8)
	local v11 = guiStateToStateLayer(p9)
	return p7[v10].State[v11]
end