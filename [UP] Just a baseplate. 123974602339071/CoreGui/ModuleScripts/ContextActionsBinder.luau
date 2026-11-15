-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Components.Connection.ContextActionsBinder
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("ContextActionService")
local v_u_3 = game:GetService("GuiService")
local v4 = require(v1.Packages.Roact)
local v5 = require(v1.Packages.RoactRodux)
local v6 = require(v1.Packages.t)
local v7 = script.Parent.Parent.Parent
local v_u_8 = require(v7.Thunks.CloseOpenPrompt)
local v9 = v4.PureComponent:extend("ContextActionsBinder")
v9.validateProps = v6.strictInterface({
	["promptOpen"] = v6.boolean,
	["closeOpenPrompt"] = v6.callback
})
function v9.init(p10) -- name: init
	p10.actionsBound = false
end
function v9.bindActions(p_u_11) -- name: bindActions
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	if not p_u_11.actionsBound then
		p_u_11.actionsBound = true
		v_u_2:BindCoreAction("CloseAvatarEditorPrompt", function(_, p12, _)
			-- upvalues: (ref) v_u_3, (copy) p_u_11
			if v_u_3.MenuIsOpen then
				return Enum.ContextActionResult.Pass
			end
			if p12 ~= Enum.UserInputState.Begin then
				return Enum.ContextActionResult.Pass
			end
			p_u_11.props.closeOpenPrompt()
			return Enum.ContextActionResult.Sink
		end, false, Enum.KeyCode.Escape)
	end
end
function v9.unbindActions(p13) -- name: unbindActions
	-- upvalues: (copy) v_u_2
	if p13.actionsBound then
		p13.actionsBound = false
		v_u_2:UnbindCoreAction("CloseAvatarEditorPrompt")
	end
end
function v9.didMount(p14) -- name: didMount
	if p14.props.promptOpen then
		p14:bindActions()
	end
end
function v9.render(_) -- name: render
	return nil
end
function v9.didUpdate(p15, p16, _) -- name: didUpdate
	if p15.props.promptOpen ~= p16.promptOpen then
		if p15.props.promptOpen then
			p15:bindActions()
			return
		end
		p15:unbindActions()
	end
end
function v9.willUnmount(p17) -- name: willUnmount
	if p17.actionsBound then
		p17:unbindActions()
	end
end
return v5.connect(function(p18) -- name: mapStateToProps
	return {
		["promptOpen"] = p18.promptInfo.promptType ~= nil
	}
end, function(p_u_19) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_8
	return {
		["closeOpenPrompt"] = function() -- name: closeOpenPrompt
			-- upvalues: (copy) p_u_19, (ref) v_u_8
			return p_u_19(v_u_8)
		end
	}
end)(v9)