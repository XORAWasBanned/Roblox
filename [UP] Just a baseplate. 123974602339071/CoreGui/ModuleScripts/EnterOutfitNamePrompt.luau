-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Components.Prompts.EnterOutfitNamePrompt
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = require(v1.Packages.t)
local v_u_6 = require(v1.Packages.UIBlox).App.Button.Enum.ButtonType
v2:WaitForChild("RobloxGui")
local v_u_7 = require(v1.Workspace.Packages.RobloxTranslator)
local v8 = script.Parent.Parent
local v9 = v8.Parent
local v_u_10 = require(v8.Prompts.PromptWithTextField)
local v_u_11 = require(v9.Thunks.SignalCreateOutfitPermissionDenied)
local v_u_12 = require(v9.Thunks.PerformCreateOutfit)
local v13 = v_u_3.PureComponent:extend("EnterOutfitNamePrompt")
v13.validateProps = v5.strictInterface({
	["screenSize"] = v5.Vector2,
	["signalCreateOutfitPermissionDenied"] = v5.callback,
	["performCreateOutfit"] = v5.callback
})
function v13.init(p_u_14) -- name: init
	-- upvalues: (copy) v_u_3
	p_u_14:setState({
		["outfitName"] = "",
		["alertPosition"] = nil,
		["alertPosition"] = UDim2.fromScale(0.5, 0.5)
	})
	p_u_14.textBoxRef = v_u_3.createRef()
	function p_u_14.confirmCreateOutfit()
		-- upvalues: (copy) p_u_14
		p_u_14.props.performCreateOutfit(p_u_14.state.outfitName)
	end
	function p_u_14.textUpdated(p15)
		-- upvalues: (copy) p_u_14
		p_u_14:setState({
			["outfitName"] = p15
		})
	end
end
function v13.render(p16) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_10, (copy) v_u_7, (copy) v_u_6
	local v17 = v_u_3.createElement
	local v18 = v_u_10
	local v19 = {
		["fieldText"] = p16.state.outfitName,
		["onFieldTextUpdated"] = p16.textUpdated,
		["title"] = v_u_7:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptTitle")
	}
	local v20 = {}
	local v21 = {}
	local v22 = {
		["props"] = nil,
		["isDefaultChild"] = true,
		["props"] = {
			["onActivated"] = p16.props.signalCreateOutfitPermissionDenied,
			["text"] = v_u_7:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptNo")
		}
	}
	local v23 = {
		["buttonType"] = nil,
		["props"] = nil,
		["isDefaultChild"] = false,
		["buttonType"] = v_u_6.PrimarySystem,
		["props"] = {
			["isDisabled"] = p16.state.outfitName == "",
			["onActivated"] = p16.confirmCreateOutfit,
			["text"] = v_u_7:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptYes")
		}
	}
	__set_list(v21, 1, {v22, v23})
	v20.buttons = v21
	v19.buttonStackInfo = v20
	return v17(v18, v19)
end
return v4.connect(function(p24) -- name: mapStateToProps
	return {
		["screenSize"] = p24.screenSize
	}
end, function(p_u_25) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_11, (copy) v_u_12
	return {
		["signalCreateOutfitPermissionDenied"] = function() -- name: signalCreateOutfitPermissionDenied
			-- upvalues: (copy) p_u_25, (ref) v_u_11
			return p_u_25(v_u_11)
		end,
		["performCreateOutfit"] = function(p26) -- name: performCreateOutfit
			-- upvalues: (copy) p_u_25, (ref) v_u_12
			return p_u_25(v_u_12(p26))
		end
	}
end)(v13)