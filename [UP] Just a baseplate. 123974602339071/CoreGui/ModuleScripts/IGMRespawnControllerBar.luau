-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.IGMRespawnControllerBar
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.t
local v5 = script.Parent.Parent
local v_u_6 = require(script.Parent.IGMControllerBar2)
local v_u_7 = require(v5.Resources.Constants)
local v_u_8 = require(v5.Localization.withLocalization)
local v9 = v_u_3.PureComponent:extend("IGMRespawnControllerBar")
v9.validateProps = v4.strictInterface({
	["inputType"] = v4.string
})
function v9.render(p10) -- name: render
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_3, (copy) v_u_6
	if p10.props.inputType == v_u_7.InputType.Gamepad then
		return v_u_8({
			["cancel"] = "CoreScripts.InGameMenu.ControllerBar.Cancel",
			["respawn"] = "CoreScripts.InGameMenu.ControllerBar.Respawn"
		})(function(p11)
			-- upvalues: (ref) v_u_3, (ref) v_u_6
			local v12 = v_u_3.createElement
			local v13 = v_u_6
			local v14 = {
				["leftHint"] = {
					["text"] = p11.cancel,
					["keyCode"] = Enum.KeyCode.ButtonB
				},
				["rightHints"] = {
					{
						["text"] = p11.respawn,
						["keyCode"] = Enum.KeyCode.ButtonA
					}
				}
			}
			return v12(v13, v14)
		end)
	else
		return nil
	end
end
return v9