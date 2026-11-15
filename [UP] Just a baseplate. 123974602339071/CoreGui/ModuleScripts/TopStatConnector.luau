-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.Connection.TopStatConnector
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v3 = game:GetService("UserInputService")
local v4 = game:GetService("GuiService")
local v5 = require(v1.Packages.Roact)
local v6 = require(v1.Packages.React)
local v7 = require(v1.Packages.RoactRodux)
local v8 = require(v1.Workspace.Packages.PlayerList)
local v9 = v2:WaitForChild("RobloxGui")
local v10 = require(v9.Modules.TenFootInterface)
local v11 = script.Parent.Parent.Parent
local v12 = require(v11.Flags.FFlagPlayerListReduceRerenders)
local v13 = require(v11.Flags.FFlagPlayerListRemoveTopStat)
local v14 = v8.Flags.FFlagEnableMobilePlayerListOnConsole
local v15 = game:DefineFastFlag("PlayerListTopStatCheckGamepad", false)
local v16 = require(v1.Workspace.Packages.SharedFlags).FFlagLuaSupportMicroGamepadPreferredInput
local v_u_17 = nil
if not v13 then
	if v15 and v3.PreferredInput ~= Enum.PreferredInput.Gamepad then
		if v16 then
			v16 = v3.PreferredInput == Enum.PreferredInput.MicroGamepad
		end
	else
		v16 = true
	end
	if v14 then
		if v4.ViewportDisplaySize ~= Enum.DisplaySize.Large then
			v16 = false
		end
	else
		v16 = v10:IsEnabled()
	end
	if v16 then
		v_u_17 = v10:SetupTopStat()
	end
end
local v18 = v5.PureComponent:extend("TopStatConnector")
function v18.render(p19) -- name: render
	-- upvalues: (ref) v_u_17
	if v_u_17 then
		v_u_17:SetTopStatEnabled(p19.props.displayOptions.playerlistCoreGuiEnabled)
	end
	return nil
end
local function v21(p20) -- name: mapStateToProps
	return {
		["displayOptions"] = p20.displayOptions
	}
end
if v12 then
	return v6.memo(v7.connect(v21, nil)(v18))
else
	return v7.connect(v21, nil)(v18)
end