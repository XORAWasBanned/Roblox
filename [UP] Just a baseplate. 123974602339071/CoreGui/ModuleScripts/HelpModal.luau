-- Path: CoreGui.RobloxGui.Modules.Feedback.Components.HelpModal
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.RoactRodux)
local v_u_4 = require(v1.Packages.Signals)
local v_u_5 = require(v1.Workspace.Packages.Display)
local v6 = script.Parent.Parent
local v_u_7 = require(v6.Components.PortedComponents.ThemedTextLabel)
local v_u_8 = require(v6.Components.ModalDialog)
local v_u_9 = require(v6.Thunks.ShowHelpModalThunk)
local v_u_10 = require(v1.Workspace.Packages.Localization).withLocalization
local v11 = v_u_2.PureComponent:extend("HelpModal")
local v_u_12 = require(v1.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize
local v13 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_14 = require(v13.Modules.Flags.GetFFlagEnableSendImageFeedbackToBackend)
function v11.init(p_u_15) -- name: init
	-- upvalues: (copy) v_u_12, (copy) v_u_5, (copy) v_u_4
	function p_u_15.onDismiss()
		-- upvalues: (copy) p_u_15
		p_u_15.props.showHelpModal(false)
	end
	if v_u_12 then
		local v_u_16 = v_u_5.GetDisplayStore(false).getViewportSize
		p_u_15.disposeScreenSize = v_u_4.createEffect(function(p17)
			-- upvalues: (copy) p_u_15, (copy) v_u_16
			p_u_15:setState({
				["screenSize"] = v_u_16(p17)
			})
		end)
	end
end
function v11.willUnmount(p18) -- name: willUnmount
	-- upvalues: (copy) v_u_12
	if v_u_12 then
		p18.disposeScreenSize()
	end
end
function v11.render(p_u_19) -- name: render
	-- upvalues: (copy) v_u_10, (copy) v_u_14, (copy) v_u_2, (copy) v_u_8, (copy) v_u_12, (copy) v_u_7
	return v_u_10({
		["mainHeader"] = "CoreScripts.Feedback.Help.MainHeader",
		["instructionLabel"] = nil,
		["instructionLabel"] = v_u_14() and "CoreScripts.Feedback.Help.InstructionsWithImage" or "CoreScripts.Feedback.Help.Instructions"
	})(function(p20)
		-- upvalues: (ref) v_u_2, (ref) v_u_8, (copy) p_u_19, (ref) v_u_12, (ref) v_u_7
		local v21 = v_u_2.createElement
		local v22 = v_u_8
		local v23 = {
			["visible"] = nil,
			["screenSize"] = nil,
			["titleText"] = nil,
			["maxHeight"] = 130,
			["maxWidth"] = 540,
			["showCloseButton"] = true,
			["contents"] = nil,
			["onDismiss"] = nil,
			["visible"] = p_u_19.props.visible
		}
		local v24
		if v_u_12 then
			v24 = p_u_19.state.screenSize
		else
			v24 = p_u_19.props.screenSize
		end
		v23.screenSize = v24
		v23.titleText = p20.mainHeader
		local v25 = v_u_2.createElement
		local v26 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Size"] = UDim2.fromScale(1, 1)
		}
		local v27 = {
			["Padding"] = v_u_2.createElement("UIPadding", {
				["PaddingLeft"] = UDim.new(0, 24),
				["PaddingRight"] = UDim.new(0, 24)
			}),
			["Layout"] = v_u_2.createElement("UIListLayout", {
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["VerticalAlignment"] = Enum.VerticalAlignment.Top
			}),
			["InstructionLabel"] = v_u_2.createElement(v_u_7, {
				["LayoutOrder"] = 1,
				["fontKey"] = "Body",
				["themeKey"] = "TextDefault",
				["AnchorPoint"] = nil,
				["Position"] = nil,
				["Size"] = nil,
				["Text"] = nil,
				["TextWrapped"] = true,
				["TextXAlignment"] = nil,
				["AnchorPoint"] = Vector2.new(0, 0.5),
				["Position"] = UDim2.new(0, 76, 0.5, 0),
				["Size"] = UDim2.new(1, 0, 0.4, 36),
				["Text"] = p20.instructionLabel,
				["TextXAlignment"] = Enum.TextXAlignment.Left
			})
		}
		v23.contents = v25("Frame", v26, v27)
		v23.onDismiss = p_u_19.onDismiss
		return v21(v22, v23)
	end)
end
return v3.connect(function(p28)
	-- upvalues: (copy) v_u_12
	local v29 = {}
	local v30
	if v_u_12 then
		v30 = nil
	else
		v30 = p28.displayOptions.screenSize
	end
	v29.screenSize = v30
	v29.visible = p28.common.showHelpModal
	return v29
end, function(p_u_31)
	-- upvalues: (copy) v_u_9
	return {
		["showHelpModal"] = function(p32) -- name: showHelpModal
			-- upvalues: (copy) p_u_31, (ref) v_u_9
			p_u_31(v_u_9(p32))
		end
	}
end)(v11)