-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.Connection.ContextActionsBinder
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("ContextActionService")
local v_u_3 = game:GetService("GuiService")
local v4 = require(v1.Packages.Roact)
local v5 = require(v1.Packages.React)
local v6 = require(v1.Packages.RoactRodux)
local v7 = require(v1.Workspace.Packages.PlayerList)
local v8 = script.Parent.Parent.Parent
local v_u_9 = require(v8.Actions.SetPlayerListVisibility)
local v_u_10 = require(v8.Actions.ClosePlayerDropDown)
local v11 = require(v8.Flags.FFlagPlayerListReduceRerenders)
local v_u_12 = v7.Flags.FFlagAddNewPlayerListMobileFocusNav
local v_u_13 = v7.Flags.FFlagPlayerListUseMobileOnSmallDisplay
local v14 = v4.PureComponent:extend("ContextActionsBinder")
local v_u_15 = {
	Enum.UserInputType.Gamepad1,
	Enum.UserInputType.Gamepad2,
	Enum.UserInputType.Gamepad3,
	Enum.UserInputType.Gamepad4,
	Enum.UserInputType.Gamepad5,
	Enum.UserInputType.Gamepad6,
	Enum.UserInputType.Gamepad7,
	Enum.UserInputType.Gamepad8
}
function v14.init(p16) -- name: init
	p16.boundPlayerListActions = false
end
function v14.bindActions(p_u_17) -- name: bindActions
	-- upvalues: (copy) v_u_2, (copy) v_u_13, (copy) v_u_3, (copy) v_u_15, (copy) v_u_12
	v_u_2:BindCoreAction("RbxPlayerListToggle", function(_, p18, _)
		-- upvalues: (ref) v_u_13, (copy) p_u_17, (ref) v_u_3
		if v_u_13 and p_u_17.props.displayOptions.isSmallTouchDevice then
			return Enum.ContextActionResult.Pass
		end
		if v_u_3.MenuIsOpen then
			return Enum.ContextActionResult.Pass
		end
		if p18 ~= Enum.UserInputState.Begin then
			return Enum.ContextActionResult.Pass
		end
		p_u_17.props.setVisibility(not p_u_17.props.displayOptions.isVisible)
		return Enum.ContextActionResult.Sink
	end, false, Enum.KeyCode.Tab)
	local v19 = v_u_15
	v_u_2:BindCoreAction("RbxPlayerListStopMovement", function(_, _, _)
		-- upvalues: (copy) p_u_17
		if p_u_17.props.displayOptions.isVisible and p_u_17.props.displayOptions.isTenFootInterface then
			return Enum.ContextActionResult.Sink
		else
			return Enum.ContextActionResult.Pass
		end
	end, false, unpack(v19))
	local v20 = v_u_2
	local v21 = "RbxPlayerListGamepadClose"
	local function v23(_, p22, _)
		-- upvalues: (copy) p_u_17, (ref) v_u_12
		if p22 == Enum.UserInputState.Begin then
			if p_u_17.props.displayOptions.isTenFootInterface or v_u_12 and p_u_17.props.displayOptions.isSmallTouchDevice then
				if v_u_12 and p_u_17.props.playerDropDown.isVisible then
					p_u_17.props.closePlayerDropDown()
					return Enum.ContextActionResult.Sink
				else
					if v_u_12 then
						if p_u_17.props.displayOptions.isVisible then
							p_u_17.props.setVisibility(false)
							return Enum.ContextActionResult.Sink
						end
					elseif p_u_17.props.displayOptions.isVisible and p_u_17.props.displayOptions.isTenFootInterface then
						p_u_17.props.setVisibility(false)
						return Enum.ContextActionResult.Sink
					end
					return Enum.ContextActionResult.Pass
				end
			else
				return Enum.ContextActionResult.Pass
			end
		else
			return Enum.ContextActionResult.Pass
		end
	end
	local v24 = false
	local v25 = Enum.KeyCode.ButtonB
	local v26
	if v_u_12 then
		v26 = Enum.KeyCode.ButtonB
	else
		v26 = Enum.KeyCode.ButtonStart
	end
	v20:BindCoreAction(v21, v23, v24, v25, v26)
	p_u_17.boundPlayerListActions = true
end
function v14.unbindActions(p27) -- name: unbindActions
	-- upvalues: (copy) v_u_2
	v_u_2:UnbindCoreAction("RbxPlayerListToggle")
	v_u_2:UnbindCoreAction("RbxPlayerListStopMovement")
	v_u_2:UnbindCoreAction("RbxPlayerListGamepadClose")
	p27.boundPlayerListActions = false
end
function v14.didMount(p28) -- name: didMount
	p28:bindActions()
end
function v14.render(_) -- name: render
	return nil
end
function v14.willUnmount(p29) -- name: willUnmount
	if p29.boundPlayerListActions then
		p29:unbindActions()
	end
end
local function v33(p30) -- name: mapStateToProps
	-- upvalues: (copy) v_u_12
	local v31 = {
		["displayOptions"] = p30.displayOptions
	}
	local v32
	if v_u_12 then
		v32 = p30.playerDropDown
	else
		v32 = nil
	end
	v31.playerDropDown = v32
	return v31
end
local function v36(p_u_34) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_9, (copy) v_u_12, (copy) v_u_10
	return {
		["setVisibility"] = function(p35) -- name: setVisibility
			-- upvalues: (copy) p_u_34, (ref) v_u_9
			return p_u_34(v_u_9(p35))
		end,
		["closePlayerDropDown"] = v_u_12 and function()
			-- upvalues: (copy) p_u_34, (ref) v_u_10
			return p_u_34(v_u_10())
		end or nil
	}
end
if v11 then
	return v5.memo(v6.connect(v33, v36)(v14))
else
	return v6.connect(v33, v36)(v14)
end