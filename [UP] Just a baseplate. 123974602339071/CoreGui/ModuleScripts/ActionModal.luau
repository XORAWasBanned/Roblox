-- Path: CoreGui.RobloxGui.Modules.Settings.Components.Blocking.ActionModal
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.t)
local v4 = require(v1.Packages.UIBlox)
local v_u_5 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v_u_6 = v4.App.Button.Enum.ButtonType
local v_u_7 = v4.App.Dialog.Alert.InteractiveAlert
local v_u_8 = require(v1.Workspace.Packages.PlayerList).Flags.FFlagAddNewPlayerListMobileFocusNav
local v9 = v_u_2.PureComponent:extend("ActionModal")
v9.defaultProps = {
	["screenSize"] = Vector2.new(1000, 1000)
}
v9.validateProps = v3.interface({
	["block"] = v3.callback,
	["blockText"] = v3.string,
	["blockAndReport"] = v3.callback,
	["blockAndReportText"] = v3.string,
	["cancel"] = v3.callback,
	["cancelText"] = v3.string,
	["body"] = v3.string,
	["title"] = v3.string,
	["screenSize"] = v3.optional(v3.Vector2)
})
function v9.render(p_u_10) -- name: render
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_7, (copy) v_u_8, (copy) v_u_6
	return v_u_5(function(p11)
		local v12 = {}
		local v13 = {
			["Overlay"] = {
				["Color"] = p11.Color.Common.Scrim.Color3,
				["Transparency"] = p11.Color.Common.Scrim.Transparency
			}
		}
		v12.Theme = v13
		return v12
	end, function(p14)
		-- upvalues: (ref) v_u_2, (copy) p_u_10, (ref) v_u_7, (ref) v_u_8, (ref) v_u_6
		local v15 = v_u_2.createElement
		local v16 = "ImageButton"
		local v17 = {
			["Size"] = UDim2.new(1, 0, 1, 0),
			["BackgroundTransparency"] = p14.Theme.Overlay.Transparency,
			["BackgroundColor3"] = p14.Theme.Overlay.Color,
			["Active"] = true,
			["AutoButtonColor"] = false,
			["Selectable"] = false,
			["Visible"] = p_u_10.props.Visible,
			[v_u_2.Event.Activated] = p_u_10.props.cancel
		}
		local v18 = {}
		local v19 = v_u_2.createElement
		local v20 = v_u_7
		local v21 = {
			["screenSize"] = nil,
			["title"] = nil,
			["bodyText"] = nil,
			["richText"] = true,
			["isRoactGamepadEnabled"] = nil,
			["buttonStackInfo"] = nil,
			["screenSize"] = p_u_10.props.screenSize,
			["title"] = p_u_10.props.title,
			["bodyText"] = p_u_10.props.body
		}
		local v22
		if v_u_8 then
			v22 = false
		else
			v22 = nil
		end
		v21.isRoactGamepadEnabled = v22
		local v23 = {
			["buttons"] = {
				{
					["buttonType"] = v_u_6.Secondary,
					["props"] = {
						["text"] = p_u_10.props.cancelText,
						["onActivated"] = p_u_10.props.cancel
					}
				},
				{
					["buttonType"] = v_u_6.Alert,
					["props"] = {
						["text"] = p_u_10.props.blockAndReportText,
						["onActivated"] = p_u_10.props.blockAndReport
					}
				},
				{
					["buttonType"] = v_u_6.Alert,
					["props"] = {
						["text"] = p_u_10.props.blockText,
						["onActivated"] = p_u_10.props.block
					}
				}
			}
		}
		v21.buttonStackInfo = v23
		v18.AlertModal = v19(v20, v21)
		return v15(v16, v17, v18)
	end)
end
return v9