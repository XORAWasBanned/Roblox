-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.MenuIconTooltip
local v_u_1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.Signals)
local v_u_4 = require(v2.Workspace.Packages.Display)
local v5 = require(v2.Packages.InGameMenuDependencies)
local v_u_6 = v5.Roact
local v7 = v5.RoactRodux
local v8 = v5.t
local v9 = v5.UIBlox
local v10 = script.Parent.Parent
local v_u_11 = require(v10.Localization.withLocalization)
local v_u_12 = require(v10.Actions.SetMenuIconTooltipOpen)
local v_u_13 = require(v10.Parent.TopBar.Constants)
local v_u_14 = v9.App.Dialog.Tooltip
local v15 = v_u_6.PureComponent:extend("MenuIconTooltip")
v15.validateProps = v8.strictInterface({
	["isTooltipOpen"] = v8.boolean,
	["onDismiss"] = v8.callback
})
function v15.init(p_u_16) -- name: init
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	p_u_16.disposeUiScaleEffect = v_u_3.createEffect(function(p17)
		-- upvalues: (ref) v_u_4, (copy) p_u_16
		p_u_16:setState({
			["UiScale"] = v_u_4.GetDisplayStore(p17).getUIScale(p17)
		})
	end)
end
function v15.render(p_u_18) -- name: render
	-- upvalues: (copy) v_u_11, (copy) v_u_13, (copy) v_u_6, (copy) v_u_1, (copy) v_u_14
	return v_u_11({
		["bodyText"] = "CoreScripts.InGameMenu.EducationalPopup.MenuIconTooltip"
	})(function(p19)
		-- upvalues: (ref) v_u_13, (copy) p_u_18, (ref) v_u_6, (ref) v_u_1, (ref) v_u_14
		local v20 = v_u_13.TopBarHeight * p_u_18.state.UiScale
		local v21 = v_u_13.ScreenSideOffset * p_u_18.state.UiScale
		local v22 = Vector2.new(v21, v20 - 32)
		local v23 = p_u_18.props.isTooltipOpen
		if v23 then
			local v24 = v_u_6.createElement
			local v25 = v_u_6.Portal
			local v26 = {
				["target"] = v_u_1
			}
			local v27 = {}
			local v28 = v_u_6.createElement
			local v29 = {
				["IgnoreGuiInset"] = true,
				["ZIndexBehavior"] = nil,
				["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
			}
			local v30 = {
				["Tooltip"] = v_u_6.createElement(v_u_14, {
					["triggerPosition"] = nil,
					["triggerSize"] = nil,
					["bodyText"] = nil,
					["onDismiss"] = nil,
					["forceClickTriggerPoint"] = true,
					["triggerPosition"] = v22,
					["triggerSize"] = Vector2.new(32, 32),
					["bodyText"] = p19.bodyText,
					["onDismiss"] = p_u_18.props.onDismiss
				})
			}
			v27.TooltipScreenGui = v28("ScreenGui", v29, v30)
			v23 = v24(v25, v26, v27)
		end
		return v23
	end)
end
function v15.willUnmount(p31) -- name: willUnmount
	if p31.disposeUiScaleEffect then
		p31.disposeUiScaleEffect()
	end
end
return v7.UNSTABLE_connect2(function(p32, _)
	return {
		["isTooltipOpen"] = p32.nativeClosePrompt.menuIconTooltipOpen
	}
end, function(p_u_33)
	-- upvalues: (copy) v_u_12
	return {
		["onDismiss"] = function() -- name: onDismiss
			-- upvalues: (copy) p_u_33, (ref) v_u_12
			p_u_33(v_u_12(false))
		end
	}
end)(v15)