-- Path: CoreGui.RobloxGui.Modules.Feedback.Components.RefinedFeedbackBar
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("TextService")
local v_u_3 = game:GetService("ExperienceStateCaptureService")
local v4 = script.Parent.Parent
local v_u_5 = require(v4.Thunks.ShowHelpModalThunk)
local v_u_6 = require(v1.Workspace.Packages.Localization).withLocalization
local v_u_7 = require(script.Parent.FeedbackBarHint)
local v_u_8 = require(v1.Packages.Roact)
local v9 = require(v1.Packages.RoactRodux)
local v10 = require(v1.Packages.UIBlox)
local v11 = require(v1.Packages.t)
local v_u_12 = require(v1.Packages.Cryo)
local v_u_13 = v10.Core.Style.withStyle
local v_u_14 = v10.App.Button.ButtonStack
local v_u_15 = v10.App.Button.Enum.ButtonType
local v_u_16 = v_u_8.PureComponent:extend("RefinedFeedbackBar")
local function v_u_17(...) -- name: GetTextSize
	-- upvalues: (copy) v_u_2
	return v_u_2:GetTextSize(...) + Vector2.new(2, 2)
end
local v18 = {
	["leftHint"] = v11.strictInterface({
		["text"] = v11.string
	})
}
v_u_16.validateProps = v11.strictInterface(v18)
function v_u_16.init(p_u_19) -- name: init
	-- upvalues: (copy) v_u_3
	p_u_19.state = {
		["barWidth"] = 0,
		["hintStringsConcat"] = nil,
		["requiredSpace"] = nil,
		["hintRatios"] = nil
	}
	function p_u_19.onExitFeedbackMode()
		-- upvalues: (ref) v_u_3
		v_u_3:ToggleCaptureMode()
	end
	function p_u_19.openHelpModal()
		-- upvalues: (copy) p_u_19
		p_u_19.props.showHelpModal(true)
	end
end
function v_u_16.calculateHintRatios(p20) -- name: calculateHintRatios
	-- upvalues: (copy) v_u_12, (copy) v_u_17
	local v21 = v_u_12.List.join({ p20 }, {})
	local v22 = {}
	local v23 = 0
	local v24 = 84
	local v25 = ""
	for _, v26 in ipairs(v21) do
		v22[v26.text] = v_u_17(v26.text, 17, 2, Vector2.new(10000, 10000)).X
		v23 = v23 + v22[v26.text]
		v24 = v24 + 36 + 8
		v25 = v25 .. v26.text
	end
	for v27, v28 in pairs(v22) do
		v22[v27] = v28 / v23
	end
	local v29 = #v21 - 2
	return v22, v24 + math.max(v29, 0) * 40, v25
end
function v_u_16.getDerivedStateFromProps(p30) -- name: getDerivedStateFromProps
	-- upvalues: (copy) v_u_16
	local v31, v32, v33 = v_u_16.calculateHintRatios(p30.leftHint)
	return {
		["hintRatios"] = v31,
		["requiredSpace"] = v32,
		["hintStringsConcat"] = v33
	}
end
function v_u_16.calculateHintSize(p34, p35, p36) -- name: calculateHintSize
	-- upvalues: (copy) v_u_17
	local v37 = p35 - p34.state.requiredSpace
	local v38 = p36.Header2.RelativeSize * p36.BaseSize
	local v39 = p36.Header2.RelativeMinSize * p36.BaseSize
	local v40 = v_u_17(p34.state.hintStringsConcat, v39, p36.Header2.Font, Vector2.new(10000, 10000)).X
	if v40 > v37 then
		local v41 = {}
		for v42, v43 in pairs(p34.state.hintRatios) do
			v41[v42] = v43 * v37
		end
		return v41
	end
	local v44 = v_u_17(p34.state.hintStringsConcat, v38, p36.Header2.Font, Vector2.new(10000, 10000)).X
	local v45 = (v38 - v39) / (v44 - v40)
	local v46 = v38 - v45 * v44
	local v47 = v37 * v45 + v46
	return nil, math.clamp(v47, v39, v38)
end
function v_u_16.render(p_u_48) -- name: render
	-- upvalues: (copy) v_u_13, (copy) v_u_8, (copy) v_u_7, (copy) v_u_6, (copy) v_u_14, (copy) v_u_15
	return v_u_13(function(p49)
		-- upvalues: (ref) v_u_8, (ref) v_u_7, (copy) p_u_48, (ref) v_u_6, (ref) v_u_14, (ref) v_u_15
		local v50 = p49.Theme
		local function v52(p51) -- name: makeHint
			-- upvalues: (ref) v_u_8, (ref) v_u_7
			return v_u_8.createElement(v_u_7, p51)
		end
		local v53 = v_u_8.createElement
		local v56 = {
			["BorderSizePixel"] = 0,
			["BackgroundTransparency"] = v50.BackgroundUIContrast.Transparency,
			["BackgroundColor3"] = v50.BackgroundUIContrast.Color,
			["Size"] = UDim2.new(1, 0, 0, 72),
			["Position"] = UDim2.fromScale(0, 1),
			["AnchorPoint"] = Vector2.new(0, 1),
			[v_u_8.Change.AbsoluteSize] = function(p54)
				-- upvalues: (ref) p_u_48
				p_u_48:setState({
					["barWidth"] = p54.AbsoluteSize.X
				})
			end,
			[v_u_8.Event.AncestryChanged] = function(p55)
				-- upvalues: (ref) p_u_48
				p_u_48:setState({
					["barWidth"] = p55.AbsoluteSize.X
				})
			end
		}
		local v57 = {
			["Padding"] = v_u_8.createElement("UIPadding", {
				["PaddingLeft"] = UDim.new(0, 24),
				["PaddingRight"] = UDim.new(0, 24)
			}),
			["LeftFrame"] = v_u_8.createElement("Frame", {
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["Size"] = UDim2.fromScale(0.5, 1)
			}, { v_u_8.createElement("UIListLayout", {
					["key"] = "Layout",
					["SortOrder"] = nil,
					["FillDirection"] = nil,
					["HorizontalAlignment"] = nil,
					["VerticalAlignment"] = nil,
					["Padding"] = nil,
					["SortOrder"] = Enum.SortOrder.LayoutOrder,
					["FillDirection"] = Enum.FillDirection.Horizontal,
					["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
					["VerticalAlignment"] = Enum.VerticalAlignment.Center,
					["Padding"] = UDim.new(0, 40)
				}), v52(p_u_48.props.leftHint) })
		}
		local v58 = v_u_8.createElement
		local v59 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["Size"] = UDim2.fromScale(0.35, 1),
			["Position"] = UDim2.fromScale(1, 0),
			["AnchorPoint"] = Vector2.new(1, 0)
		}
		local v67 = {
			["Layout"] = v_u_8.createElement("UIListLayout", {
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center,
				["Padding"] = UDim.new(0, 40)
			}),
			["Buttons"] = v_u_6({
				["helpButtonText"] = "CoreScripts.Feedback.FeedbackBar.HelpButton",
				["exitFeedbackButtonText"] = "CoreScripts.Feedback.FeedbackBar.ExitFeedbackButton"
			})(function(p60)
				-- upvalues: (ref) v_u_8, (ref) v_u_14, (ref) v_u_15, (ref) p_u_48
				local v61 = v_u_8.createElement
				local v62 = v_u_14
				local v63 = {
					["buttonHeight"] = 50,
					["buttons"] = nil,
					["forcedFillDirection"] = nil
				}
				local v64 = {}
				local v65 = {
					["buttonType"] = v_u_15.Secondary,
					["props"] = {
						["onActivated"] = p_u_48.openHelpModal,
						["text"] = p60.helpButtonText
					}
				}
				local v66 = {
					["buttonType"] = v_u_15.PrimarySystem,
					["props"] = {
						["isDisabled"] = false,
						["onActivated"] = nil,
						["text"] = nil,
						["onActivated"] = p_u_48.onExitFeedbackMode,
						["text"] = p60.exitFeedbackButtonText
					}
				}
				__set_list(v64, 1, {v65, v66})
				v63.buttons = v64
				v63.forcedFillDirection = Enum.FillDirection.Horizontal
				return v61(v62, v63)
			end)
		}
		v57.RightFrame = v58("Frame", v59, v67)
		return v53("Frame", v56, v57)
	end)
end
return v9.connect(function()
	return {}
end, function(p_u_68)
	-- upvalues: (copy) v_u_5
	return {
		["showHelpModal"] = function(p69) -- name: showHelpModal
			-- upvalues: (copy) p_u_68, (ref) v_u_5
			p_u_68(v_u_5(p69))
		end
	}
end)(v_u_16)