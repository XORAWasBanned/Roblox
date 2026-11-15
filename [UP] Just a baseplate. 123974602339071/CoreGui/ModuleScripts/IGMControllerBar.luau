-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.IGMControllerBar
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v3 = v2.t
local v_u_4 = v2.Roact
local v5 = v2.RoactRodux
local v_u_6 = require(v1.Packages.UIBlox).App.Bar.ControllerBar
local v_u_7 = require(script.Parent.Parent.Actions.SetControllerBarHeight)
local v8 = script.Parent.Parent
local v_u_9 = require(v8.Localization.withLocalization)
local v_u_10 = require(script.Parent.Parent.Resources.Constants)
local v11 = v_u_4.PureComponent:extend("IGMControllerBar")
local v_u_12 = {
	["cancel"] = "CoreScripts.InGameMenu.ControllerBar.Cancel",
	["respawn"] = "CoreScripts.InGameMenu.ControllerBar.Respawn",
	["openMoreMenu"] = "CoreScripts.InGameMenu.ControllerBar.OpenMoreMenu",
	["closeMoreMenu"] = "CoreScripts.InGameMenu.ControllerBar.CloseMoreMenu",
	["back"] = "CoreScripts.InGameMenu.ControllerBar.Back",
	["respawnCharacter"] = "CoreScripts.InGameMenu.ControllerBar.RespawnCharacter",
	["leave"] = "CoreScripts.InGameMenu.ControllerBar.Leave"
}
v11.validateProps = v3.strictInterface({
	["isMenuOpen"] = v3.boolean,
	["isMainPageMoreMenuOpen"] = v3.boolean,
	["currentPage"] = v3.string,
	["respawnDialogOpen"] = v3.boolean,
	["inputType"] = v3.string,
	["screenSize"] = v3.Vector2,
	["setControllerBarHeight"] = v3.callback
})
function v11.didMount(p13) -- name: didMount
	-- upvalues: (copy) v_u_12, (copy) v_u_10
	if p13:getHints(v_u_12) then
		p13.props.setControllerBarHeight(v_u_10.ControllerBarHeight)
	else
		p13.props.setControllerBarHeight(0)
	end
end
function v11.didUpdate(p14) -- name: didUpdate
	-- upvalues: (copy) v_u_12, (copy) v_u_10
	if p14:getHints(v_u_12) then
		p14.props.setControllerBarHeight(v_u_10.ControllerBarHeight)
	else
		p14.props.setControllerBarHeight(0)
	end
end
function v11.willUnmount(p15) -- name: willUnmount
	p15.props.setControllerBarHeight(0)
end
function v11.getHints(p16, p17) -- name: getHints
	-- upvalues: (copy) v_u_10
	if p16.props.inputType == v_u_10.InputType.Gamepad then
		if p16.props.respawnDialogOpen then
			local v18 = {
				["leftHint"] = {
					["text"] = p17.cancel,
					["keyCode"] = Enum.KeyCode.ButtonB
				},
				["rightHints"] = {
					{
						["text"] = p17.respawn,
						["keyCode"] = Enum.KeyCode.ButtonA
					}
				}
			}
			return v18
		end
		if p16.props.isMenuOpen and p16.props.currentPage == "MainPage" then
			local v19
			if p16.props.isMainPageMoreMenuOpen then
				v19 = p17.closeMoreMenu
			else
				v19 = p17.openMoreMenu
			end
			local v20 = {
				["leftHint"] = {
					["text"] = p17.back,
					["keyCode"] = Enum.KeyCode.ButtonB
				},
				["rightHints"] = {
					{
						["text"] = v19,
						["keyCode"] = Enum.KeyCode.ButtonL3
					},
					{
						["text"] = p17.respawnCharacter,
						["keyCode"] = Enum.KeyCode.ButtonY
					},
					{
						["text"] = p17.leave,
						["keyCode"] = Enum.KeyCode.ButtonX
					}
				}
			}
			return v20
		end
	end
	return nil
end
function v11.render(p_u_21) -- name: render
	-- upvalues: (copy) v_u_9, (copy) v_u_12, (copy) v_u_4, (copy) v_u_6
	return v_u_9(v_u_12)(function(p22)
		-- upvalues: (copy) p_u_21, (ref) v_u_4, (ref) v_u_6
		local v23 = p_u_21:getHints(p22)
		if v23 then
			return v_u_4.createElement(v_u_6, v23)
		else
			return nil
		end
	end)
end
return v5.connect(function(p24, _) -- name: mapStateToProps
	return {
		["isMenuOpen"] = p24.isMenuOpen,
		["isMainPageMoreMenuOpen"] = p24.isMainPageMoreMenuOpen,
		["currentPage"] = p24.menuPage,
		["respawnDialogOpen"] = p24.respawn.dialogOpen,
		["inputType"] = p24.displayOptions.inputType,
		["screenSize"] = p24.screenSize
	}
end, function(p_u_25)
	-- upvalues: (copy) v_u_7
	return {
		["setControllerBarHeight"] = function(p26) -- name: setControllerBarHeight
			-- upvalues: (copy) p_u_25, (ref) v_u_7
			p_u_25(v_u_7(p26))
		end
	}
end)(v11)