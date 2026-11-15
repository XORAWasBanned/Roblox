-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.IGMMainPageControllerBar
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("VRService")
local v3 = require(v1.Packages.InGameMenuDependencies)
local v_u_4 = v3.Roact
local v5 = v3.t
local v6 = script.Parent.Parent
local v_u_7 = require(script.Parent.IGMControllerBar2)
local v_u_8 = require(v6.Localization.withLocalization)
local v9 = v_u_4.PureComponent:extend("IGMMainPageControllerBar")
v9.validateProps = v5.strictInterface({
	["canCaptureFocus"] = v5.boolean,
	["isMainPageMoreMenuOpen"] = v5.boolean
})
function v9.render(p_u_10) -- name: render
	-- upvalues: (copy) v_u_8, (copy) v_u_2, (copy) v_u_4, (copy) v_u_7
	if p_u_10.props.canCaptureFocus then
		return v_u_8({
			["openMoreMenu"] = "CoreScripts.InGameMenu.ControllerBar.OpenMoreMenu",
			["closeMoreMenu"] = "CoreScripts.InGameMenu.ControllerBar.CloseMoreMenu",
			["back"] = "CoreScripts.InGameMenu.ControllerBar.Back",
			["respawnCharacter"] = "CoreScripts.InGameMenu.ControllerBar.RespawnCharacter",
			["leave"] = "CoreScripts.InGameMenu.ControllerBar.Leave"
		})(function(p11)
			-- upvalues: (ref) v_u_2, (copy) p_u_10, (ref) v_u_4, (ref) v_u_7
			local v12
			if v_u_2.VREnabled then
				v12 = {
					{
						["text"] = p11.respawnCharacter,
						["keyCode"] = Enum.KeyCode.ButtonY
					},
					{
						["text"] = p11.leave,
						["keyCode"] = Enum.KeyCode.ButtonX
					}
				}
			else
				v12 = {
					{
						["text"] = p_u_10.props.isMainPageMoreMenuOpen and p11.closeMoreMenu or p11.openMoreMenu,
						["keyCode"] = Enum.KeyCode.ButtonL3
					},
					{
						["text"] = p11.respawnCharacter,
						["keyCode"] = Enum.KeyCode.ButtonY
					},
					{
						["text"] = p11.leave,
						["keyCode"] = Enum.KeyCode.ButtonX
					}
				}
			end
			return v_u_4.createElement(v_u_7, {
				["leftHint"] = {
					["text"] = p11.back,
					["keyCode"] = Enum.KeyCode.ButtonB
				},
				["rightHints"] = v12
			})
		end)
	else
		return nil
	end
end
return v9