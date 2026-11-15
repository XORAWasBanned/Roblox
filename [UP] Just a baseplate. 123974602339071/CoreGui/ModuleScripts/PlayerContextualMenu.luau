-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.PlayerContextualMenu
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("ContextActionService")
local v_u_4 = game:GetService("GuiService")
local v5 = require(v1.Packages.InGameMenuDependencies)
local v_u_6 = v5.Roact
local v7 = v5.UIBlox
local v8 = v5.t
local v_u_9 = v7.App.Menu.BaseMenu
local v10 = script.Parent.Parent
local v_u_11 = require(script.Parent.Connection.FocusHandler)
local v_u_12 = require(script.Parent.Connection.RootedConnection)
local v13 = v10.Flags
local v_u_14 = require(v13.GetFFlagIGMGamepadSelectionHistory)
local v15 = v_u_6.PureComponent:extend("PlayerContextualMenu")
v15.validateProps = v8.strictInterface({
	["moreActions"] = v8.table,
	["actionWidth"] = v8.number,
	["xOffset"] = v8.number,
	["yOffset"] = v8.number,
	["onClose"] = v8.callback,
	["canCaptureFocus"] = v8.boolean
})
function v15.init(p16) -- name: init
	-- upvalues: (copy) v_u_6
	p16.firstOptionRef = v_u_6.createRef()
	p16.containerRef = v_u_6.createRef()
end
function v15.renderContextualMenuFocusHandler(p_u_17, p18, p19) -- name: renderContextualMenuFocusHandler
	-- upvalues: (copy) v_u_6, (copy) v_u_11, (copy) v_u_3, (copy) v_u_4, (copy) v_u_14
	local v22 = {
		["isFocused"] = p_u_17.props.canCaptureFocus and p18,
		["didFocus"] = function(p20) -- name: didFocus
			-- upvalues: (ref) v_u_3, (copy) p_u_17, (ref) v_u_4, (ref) v_u_14
			v_u_3:BindCoreAction("player_contextual_menu_close_action", function(_, p21)
				-- upvalues: (ref) p_u_17
				if p21 ~= Enum.UserInputState.End or not p_u_17.props.onClose then
					return Enum.ContextActionResult.Pass
				end
				p_u_17.props.onClose()
				return Enum.ContextActionResult.Sink
			end, false, Enum.KeyCode.ButtonB)
			v_u_4:RemoveSelectionGroup("player_contextual_menu_selection_parent")
			v_u_4:AddSelectionParent("player_contextual_menu_selection_parent", p_u_17.containerRef:getValue())
			if v_u_14() then
				v_u_4.SelectedCoreObject = p20 or p_u_17.firstOptionRef:getValue()
			else
				v_u_4.SelectedCoreObject = p_u_17.firstOptionRef:getValue()
			end
		end,
		["didBlur"] = function() -- name: didBlur
			-- upvalues: (ref) v_u_3
			v_u_3:UnbindCoreAction("player_contextual_menu_close_action")
		end
	}
	return v_u_6.createElement(v_u_11, v22, p19)
end
function v15.render(p_u_23) -- name: render
	-- upvalues: (copy) v_u_6, (copy) v_u_2, (copy) v_u_12, (copy) v_u_9
	local v24 = v_u_6.createElement
	local v25 = v_u_6.Portal
	local v26 = {
		["target"] = v_u_2
	}
	local v27 = {}
	local v28 = v_u_6.createElement
	local v29 = {
		["DisplayOrder"] = 2,
		["ZIndexBehavior"] = nil,
		["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
	}
	local v30 = {}
	local v37 = {
		["render"] = function(p31) -- name: render
			-- upvalues: (copy) p_u_23, (ref) v_u_6, (ref) v_u_9
			local v32 = p_u_23
			local v33 = {}
			local v34 = v_u_6.createElement
			local v35 = {
				["Size"] = UDim2.fromScale(1, 1),
				["BackgroundTransparency"] = 1,
				[v_u_6.Ref] = p_u_23.containerRef
			}
			local v36 = {
				["BaseMenu"] = v_u_6.createElement(v_u_9, {
					["buttonProps"] = p_u_23.props.moreActions,
					["setFirstItemRef"] = p_u_23.firstOptionRef,
					["width"] = UDim.new(0, p_u_23.props.actionWidth),
					["position"] = UDim2.fromOffset(p_u_23.props.xOffset, p_u_23.props.yOffset)
				})
			}
			v33.MoreActionsMenu = v34("Frame", v35, v36)
			return v32:renderContextualMenuFocusHandler(p31, v33)
		end
	}
	v30.RootedConnection = v_u_6.createElement(v_u_12, v37)
	v27.InGameMenuContextGui = v28("ScreenGui", v29, v30)
	return v24(v25, v26, v27)
end
return v15