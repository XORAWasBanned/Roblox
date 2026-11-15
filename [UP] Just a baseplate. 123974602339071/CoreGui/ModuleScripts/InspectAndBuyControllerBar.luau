-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Components.InspectAndBuyControllerBar
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("CoreGui")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.UIBlox)
local v_u_5 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_6 = v4.App.Bar.ControllerBar
local v7 = require(script.Parent.Common.ControllerShortcutKeycodes)
local v_u_8 = v7.Favorite
local v_u_9 = v7.TryOn
local v10 = require(v1.Packages.t)
local v11 = v_u_3.PureComponent:extend("InspectAndBuyControllerBar")
v11.validateProps = v10.strictInterface({
	["showTryOn"] = v10.boolean,
	["showFavorite"] = v10.boolean,
	["isFavorited"] = v10.boolean
})
function v11.render(p12) -- name: render
	-- upvalues: (copy) v_u_5, (copy) v_u_9, (copy) v_u_8, (copy) v_u_3, (copy) v_u_2, (copy) v_u_6
	local v13 = {
		{
			["text"] = v_u_5:FormatByKey("InGame.InspectMenu.Action.Confirm"),
			["keyCode"] = Enum.KeyCode.ButtonA
		}
	}
	if p12.props.showTryOn then
		local v14 = {
			["text"] = p12.props.tryingOn and v_u_5:FormatByKey("InGame.InspectMenu.Action.TakeOff") or v_u_5:FormatByKey("InGame.InspectMenu.Action.TryOn"),
			["keyCode"] = v_u_9
		}
		table.insert(v13, 1, v14)
	end
	if p12.props.showFavorite then
		local v15 = {
			["text"] = p12.props.isFavorited and v_u_5:FormatByKey("InGame.InspectMenu.Action.Unfavorite") or v_u_5:FormatByKey("InGame.InspectMenu.Action.Favorite"),
			["keyCode"] = v_u_8
		}
		table.insert(v13, 1, v15)
	end
	local v16 = v_u_3.createElement
	local v17 = v_u_3.Portal
	local v18 = {
		["target"] = v_u_2
	}
	local v19 = {
		["InspectAndBuyControllerBar"] = v_u_3.createElement("ScreenGui", {
			["DisplayOrder"] = 1,
			["ZIndexBehavior"] = nil,
			["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
		}, {
			["ControllerBar"] = v_u_3.createElement(v_u_6, {
				["leftHint"] = {
					["text"] = v_u_5:FormatByKey("CoreScripts.TopBar.Back"),
					["keyCode"] = Enum.KeyCode.ButtonB
				},
				["rightHints"] = v13
			})
		})
	}
	return v16(v17, v18, v19)
end
return v11