-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Components.AvatarEditorPromptsApp
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = game:GetService("UserInputService")
local v5 = game:GetService("Players")
local v_u_6 = require(v1.Packages.Roact)
local v7 = require(v1.Packages.RoactRodux)
local v_u_8 = require(v1.Packages.RoactGamepad)
local v9 = require(v1.Packages.t)
local v_u_10 = require(v1.Workspace.Packages.RoactUtils).ExternalEventConnection
local v_u_11 = require(script.Parent.Connection)
local v12 = script.Parent.Prompts
local v13 = require(v12.AllowInventoryReadAccessPrompt)
local v14 = require(v12.SaveAvatarPrompt)
local v15 = require(v12.SaveAvatarTimeoutPrompt)
local v16 = require(v12.CreateOutfitPrompt)
local v17 = require(v12.EnterOutfitNamePrompt)
local v18 = require(v12.SetFavoritePrompt)
local v19 = require(v12.DeleteOutfitPrompt)
local v20 = require(v12.RenameOutfitPrompt)
local v21 = require(v12.UpdateOutfitPrompt)
local v_u_22 = v5.LocalPlayer
local v23 = script.Parent.Parent
local v24 = require(v23.PromptType)
local v_u_25 = require(v23.Actions.ScreenSizeUpdated)
local v_u_26 = {
	[Enum.UserInputType.Gamepad1] = true,
	[Enum.UserInputType.Gamepad2] = true,
	[Enum.UserInputType.Gamepad3] = true,
	[Enum.UserInputType.Gamepad4] = true,
	[Enum.UserInputType.Gamepad5] = true,
	[Enum.UserInputType.Gamepad6] = true,
	[Enum.UserInputType.Gamepad7] = true,
	[Enum.UserInputType.Gamepad8] = true
}
local v_u_27 = {
	[v24.AllowInventoryReadAccess] = v13,
	[v24.SaveAvatar] = v14,
	[v24.CreateOutfit] = v16,
	[v24.EnterOutfitName] = v17,
	[v24.SetFavorite] = v18,
	[v24.DeleteOutfit] = v19,
	[v24.RenameOutfit] = v20,
	[v24.UpdateOutfit] = v21,
	[v24.SaveAvatarTimeout] = v15
}
local v28 = v_u_6.PureComponent:extend("AvatarEditorPromptsApp")
v28.validateProps = v9.strictInterface({
	["promptType"] = v9.optional(v9.userdata),
	["screenSizeUpdated"] = v9.callback
})
function v28.init(p_u_29) -- name: init
	-- upvalues: (copy) v_u_26, (copy) v_u_4, (copy) v_u_8
	p_u_29:setState({
		["isGamepad"] = v_u_26[v_u_4:GetLastInputType()] or false
	})
	function p_u_29.absoluteSizeChanged(p30)
		-- upvalues: (copy) p_u_29
		p_u_29.props.screenSizeUpdated(p30.AbsoluteSize)
	end
	p_u_29.focusController = v_u_8.createFocusController()
	p_u_29.selectedCoreGuiObject = nil
	p_u_29.selectedGuiObject = nil
end
function v28.render(p_u_31) -- name: render
	-- upvalues: (copy) v_u_27, (copy) v_u_6, (copy) v_u_11, (copy) v_u_10, (copy) v_u_4, (copy) v_u_26, (copy) v_u_8
	local v32 = nil
	if p_u_31.props.promptType then
		local v33 = v_u_27[p_u_31.props.promptType]
		if v33 then
			v32 = v_u_6.createElement(v33)
		else
			error("Unexpected prompt type!")
		end
	end
	if v32 == nil then
		return nil
	end
	local v34 = v_u_6.createElement
	local v35 = {
		["IgnoreGuiInset"] = true,
		["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling,
		["AutoLocalize"] = false,
		["DisplayOrder"] = -1,
		[v_u_6.Change.AbsoluteSize] = p_u_31.absoluteSizeChanged
	}
	local v37 = {
		["Connection"] = v_u_6.createElement(v_u_11),
		["LastInputTypeConnection"] = v_u_6.createElement(v_u_10, {
			["event"] = v_u_4.LastInputTypeChanged,
			["callback"] = function(p36) -- name: callback
				-- upvalues: (copy) p_u_31, (ref) v_u_26
				p_u_31:setState({
					["isGamepad"] = v_u_26[p36] or false
				})
			end
		}) or nil,
		["PromptFrame"] = v_u_6.createElement(v_u_8.Focusable.Frame, {
			["focusController"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["focusController"] = p_u_31.focusController,
			["Size"] = UDim2.fromScale(1, 1)
		}, {
			["Prompt"] = v32
		}) or nil
	}
	return v34("ScreenGui", v35, v37)
end
function v28.revertSelectedGuiObject(p38) -- name: revertSelectedGuiObject
	-- upvalues: (copy) v_u_22, (copy) v_u_2, (copy) v_u_3
	local v39 = v_u_22
	if v39 then
		v39 = v_u_22:FindFirstChildWhichIsA("PlayerGui")
	end
	if p38.selectedCoreGuiObject and p38.selectedCoreGuiObject:IsDescendantOf(v_u_2) then
		v_u_3.SelectedCoreObject = p38.selectedCoreGuiObject
	elseif p38.selectedGuiObject and p38.selectedGuiObject:IsDescendantOf(v39) then
		v_u_3.SelectedObject = p38.selectedGuiObject
		v_u_3.SelectedCoreObject = nil
	else
		v_u_3.SelectedCoreObject = nil
	end
	p38.selectedCoreGuiObject = nil
	p38.selectedGuiObject = nil
end
function v28.didUpdate(p40, p41, p42) -- name: didUpdate
	-- upvalues: (copy) v_u_3
	local v43 = p40.state.isGamepad
	if v43 then
		v43 = p40.props.promptType ~= nil
	end
	local v44 = p42.isGamepad
	if v44 then
		v44 = p41.promptType ~= nil
	end
	if v43 ~= v44 then
		if v43 then
			p40.selectedCoreGuiObject = v_u_3.SelectedCoreObject
			p40.selectedGuiObject = v_u_3.SelectedObject
			v_u_3.SelectedObject = nil
			p40.focusController.captureFocus()
			return
		end
		p40.focusController.releaseFocus()
		if p40.state.isGamepad then
			p40:revertSelectedGuiObject()
		end
	end
end
function v28.willUnmount(p45) -- name: willUnmount
	if p45.state.isGamepad then
		p45:revertSelectedGuiObject()
	end
end
return v7.connect(function(p46) -- name: mapStateToProps
	return {
		["promptType"] = p46.promptInfo.promptType
	}
end, function(p_u_47) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_25
	return {
		["screenSizeUpdated"] = function(p48) -- name: screenSizeUpdated
			-- upvalues: (copy) p_u_47, (ref) v_u_25
			return p_u_47(v_u_25(p48))
		end
	}
end)(v28)