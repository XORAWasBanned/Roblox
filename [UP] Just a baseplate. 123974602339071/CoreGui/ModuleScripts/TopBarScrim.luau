-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.TopBarScrim
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v_u_3 = require(v1.Packages.Signals)
local v_u_4 = require(v1.Packages.SignalsReact)
local v5 = require(v1.Workspace.Packages.CoreScriptsRoactCommon)
local v6 = require(v1.Workspace.Packages.CoreGuiCommon)
local v_u_7 = require(v1.Workspace.Packages.ExpChat)
local v_u_8 = require(script.Parent.GamepadConnector)
local v_u_9 = v5.Scrim
local v_u_10 = v6.Flags.FFlagEnableUISelector
local v_u_11
if v_u_10 then
	v_u_11 = v6.Stores.GetUiSelectorSignalStore
else
	v_u_11 = nil
end
local function v_u_16() -- name: createComputedScrimVisible
	-- upvalues: (copy) v_u_3, (copy) v_u_8, (copy) v_u_7, (copy) v_u_10, (copy) v_u_11
	return v_u_3.createComputed(function(p12)
		-- upvalues: (ref) v_u_8, (ref) v_u_7, (ref) v_u_10, (ref) v_u_11
		local v13 = v_u_8:topBarFocused(p12)
		local v14 = v_u_7.Stores.GetFocusNavigationStore(p12).getChatInputBarFocused(p12)
		local v15 = v_u_10
		if v15 then
			v15 = v_u_11(p12).getVisibility(p12)
		end
		return v13 or (v14 or v15)
	end)
end
return v_u_2.memo(function() -- name: TopBarScrim
	-- upvalues: (copy) v_u_4, (copy) v_u_16, (copy) v_u_2, (copy) v_u_9
	local v17 = {
		["Visible"] = v_u_4.useSignalBinding(v_u_16())
	}
	return v_u_2.createElement(v_u_9, v17)
end)