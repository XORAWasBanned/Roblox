-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Components.EmoteThumbnailEditor
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v_u_3 = require(v1.Packages.RoactGamepad)
local v4 = require(v1.Packages.t)
local v_u_5 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_6 = require(v1.Packages.Thumbnailing).EmoteUtility
local v7 = require(v1.Packages.UIBlox)
local v8 = require(v1.Packages.Foundation)
local v_u_9 = v8.Utility.normalizeFontFace
local v_u_10 = v8.Utility.Flags.FoundationFontFaceMigration
local v_u_11 = v7.Style.withStyle
local v_u_12 = v7.App.Dialog.Alert.InteractiveAlert
local v_u_13 = v7.App.Button.Enum.ButtonType
local v_u_14 = v7.App.Slider.SystemSlider
local v_u_15 = require(script.Parent.EmoteThumbnailParameters)
local v_u_16 = require(script.Parent.EmoteThumbnailView)
local v_u_17 = {
	["Rotation"] = {
		["Precision"] = 0,
		["Range"] = nil,
		["Default"] = 0,
		["Increments"] = 361,
		["Range"] = NumberRange.new(0, 360)
	}
}
local v18 = v_u_2.PureComponent:extend("EmoteThumbnailEditor")
v18.validateProps = v4.strictInterface({
	["screenSize"] = v4.Vector2,
	["animationClip"] = v4.instanceIsA("AnimationClip"),
	["initialThumbnailParameters"] = v4.optional(v_u_15.validate),
	["closePromptCallback"] = v4.callback,
	["updateThumbnailCallback"] = v4.callback
})
function v18.init(p_u_19) -- name: init
	-- upvalues: (copy) v_u_15, (copy) v_u_2
	p_u_19:setState({
		["thumbnailParameters"] = p_u_19.props.initialThumbnailParameters or v_u_15.defaultParameters
	})
	function p_u_19.onCancelPressed()
		-- upvalues: (copy) p_u_19
		p_u_19.props.closePromptCallback()
	end
	function p_u_19.onUpdatePressed()
		-- upvalues: (copy) p_u_19
		local v20 = p_u_19.state.thumbnailParameters
		p_u_19.props.updateThumbnailCallback(v20)
		p_u_19.props.closePromptCallback()
	end
	function p_u_19.onRotateChanged(p21)
		-- upvalues: (copy) p_u_19
		local v22 = table.clone(p_u_19.state.thumbnailParameters)
		v22.thumbnailCharacterRotation = p21
		p_u_19:updateThumbnailParameters(v22)
	end
	function p_u_19.onKeyframeOrTimeChanged(p23)
		-- upvalues: (copy) p_u_19
		local v24 = table.clone(p_u_19.state.thumbnailParameters)
		v24.thumbnailTime = p23
		v24.thumbnailKeyframe = p23
		p_u_19:updateThumbnailParameters(v24)
	end
	p_u_19.rotationSliderRef = v_u_2.createRef()
	p_u_19.timeSliderRef = v_u_2.createRef()
	p_u_19:updateSliderValuesForAnimationClip()
end
function v18.updateSliderValuesForAnimationClip(p25) -- name: updateSliderValuesForAnimationClip
	-- upvalues: (copy) v_u_6
	local v26 = p25.props
	local v27 = nil
	local v28 = nil
	local v29 = nil
	if v26.animationClip:IsA("KeyframeSequence") then
		v28 = #v26.animationClip:GetKeyframes()
		v27 = 1
		v29 = 1
	elseif v26.animationClip:IsA("CurveAnimation") then
		local v30 = v_u_6.GetCurveAnimationTimeLength(v26.animationClip) / 0.01
		v28 = math.floor(v30) * 0.01
		v27 = 0
		v29 = 0.01
	else
		error("Unsupported animation type:", v26.animationClip.ClassName)
	end
	p25:setState({
		["timeSliderMin"] = v27,
		["timeSliderMax"] = v28,
		["timeSliderStepInterval"] = v29
	})
end
function v18.updateThumbnailParameters(p31, p32) -- name: updateThumbnailParameters
	p31:setState({
		["thumbnailParameters"] = p32
	})
end
function v18.renderMiddle(p_u_33, p_u_34) -- name: renderMiddle
	-- upvalues: (copy) v_u_11, (copy) v_u_2, (copy) v_u_3, (copy) v_u_16, (copy) v_u_10, (copy) v_u_9, (copy) v_u_14, (copy) v_u_17
	return v_u_11(function(p35)
		-- upvalues: (copy) p_u_33, (ref) v_u_2, (ref) v_u_3, (ref) v_u_16, (ref) v_u_10, (ref) v_u_9, (copy) p_u_34, (ref) v_u_14, (ref) v_u_17
		local v36 = p35.Font
		local v37 = p35.Theme
		local v38 = {}
		if p_u_33.props.screenSize.Y > 481 then
			v38.contentSize = UDim2.new(1, 0, 0, 262)
			v38.thumbnailPosition = UDim2.new(0.5, 0, 0, 0)
			v38.thumbnailAnchorPoint = Vector2.new(0.5, 0)
			v38.leversPosition = UDim2.new(0, 0, 0, 160)
			v38.leversSize = UDim2.new(1, 0, 0, 102)
		else
			v38.contentSize = UDim2.new(1, 0, 0, 150)
			v38.thumbnailPosition = UDim2.new(0, 0, 0, 0)
			v38.thumbnailAnchorPoint = Vector2.new(0, 0)
			v38.leversPosition = UDim2.new(0, 160, 0, 0)
			v38.leversSize = UDim2.new(1, -160, 0, 102)
		end
		local v39 = p_u_33.state.thumbnailParameters
		local v40 = v39.thumbnailKeyframe
		local v41 = v39.thumbnailCharacterRotation
		local v42 = v_u_2.createElement
		local v43 = v_u_3.Focusable.Frame
		local v44 = {
			["Size"] = v38.contentSize,
			["BackgroundColor3"] = Color3.new(1, 0, 1),
			["BackgroundTransparency"] = 1,
			[v_u_2.Ref] = p_u_33.middleContentRef
		}
		local v45 = {}
		local v46 = v_u_2.createElement
		local v47 = "Frame"
		local v48 = {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 1, 0)
		}
		local v49 = {
			["ThumbnailViewParent"] = v_u_2.createElement("Frame", {
				["LayoutOrder"] = 0,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["Size"] = nil,
				["BackgroundColor3"] = nil,
				["BackgroundTransparency"] = 1,
				["Position"] = v38.thumbnailPosition,
				["AnchorPoint"] = v38.thumbnailAnchorPoint,
				["Size"] = UDim2.new(0, 150, 0, 150),
				["BackgroundColor3"] = Color3.new(1, 1, 0)
			}, {
				["EmoteThumbnailView"] = v_u_2.createElement(v_u_16, {
					["position"] = UDim2.new(0.5, 0, 0.5, 0),
					["anchorPoint"] = Vector2.new(0.5, 0.5),
					["animationClip"] = p_u_33.props.animationClip,
					["thumbnailParameters"] = p_u_33.state.thumbnailParameters
				})
			})
		}
		local v50 = v_u_2.createElement
		local v51 = "Frame"
		local v52 = {
			["LayoutOrder"] = 1,
			["Size"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = v38.leversSize,
			["AnchorPoint"] = Vector2.new(0, 0),
			["Position"] = v38.leversPosition,
			["BackgroundColor3"] = Color3.new(1, 0, 0)
		}
		local v53 = {
			["ListLayout"] = v_u_2.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Vertical,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
			})
		}
		local v54 = v_u_2.createElement
		local v55 = "TextLabel"
		local v56 = {
			["LayoutOrder"] = 0,
			["Size"] = nil,
			["Font"] = nil,
			["FontFace"] = nil,
			["TextSize"] = 12,
			["Text"] = nil,
			["TextColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["TextXAlignment"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 15)
		}
		local v57
		if v_u_10 then
			v57 = nil
		else
			v57 = v36.Body.Font
		end
		v56.Font = v57
		local v58
		if v_u_10 then
			v58 = v_u_9(p35.Tokens.Typography.BodyLarge.Font)
		else
			v58 = nil
		end
		v56.FontFace = v58
		v56.Text = p_u_34.timeLabelText
		v56.TextColor3 = v37.TextDefault.Color
		v56.TextXAlignment = Enum.TextXAlignment.Left
		v53.FrameDescriptionLabel = v54(v55, v56)
		v53.TimeSlider = v_u_2.createElement(v_u_14, {
			["layoutOrder"] = 1,
			["min"] = p_u_33.state.timeSliderMin,
			["max"] = p_u_33.state.timeSliderMax,
			["stepInterval"] = p_u_33.state.timeSliderStepInterval,
			["value"] = v40,
			["onValueChanged"] = p_u_33.onKeyframeOrTimeChanged,
			["width"] = UDim.new(1, 0),
			["position"] = UDim2.new(0, 0, 0.5, 0),
			["anchorPoint"] = Vector2.new(0, 0.5),
			["NextSelectionDown"] = p_u_33.rotationSliderRef,
			[v_u_2.Ref] = p_u_33.timeSliderRef
		})
		local v59 = v_u_2.createElement
		local v60 = "TextLabel"
		local v61 = {
			["LayoutOrder"] = 2,
			["Size"] = nil,
			["Font"] = nil,
			["FontFace"] = nil,
			["TextSize"] = 12,
			["Text"] = nil,
			["TextColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["TextXAlignment"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 15)
		}
		local v62
		if v_u_10 then
			v62 = nil
		else
			v62 = v36.Body.Font
		end
		v61.Font = v62
		local v63
		if v_u_10 then
			v63 = v_u_9(p35.Tokens.Typography.BodyLarge.Font)
		else
			v63 = nil
		end
		v61.FontFace = v63
		v61.Text = p_u_34.rotationLabelText
		v61.TextColor3 = v37.TextDefault.Color
		v61.TextXAlignment = Enum.TextXAlignment.Left
		v53.RotationDescriptionLabel = v59(v60, v61)
		local v64 = v_u_2.createElement
		local v65 = v_u_14
		local v66 = {
			["layoutOrder"] = 3,
			["min"] = v_u_17.Rotation.Range.Min,
			["max"] = v_u_17.Rotation.Range.Max
		}
		local v67 = v_u_17.Rotation
		v66.stepInterval = (v67.Range.Max - v67.Range.Min) / (v67.Increments - 1)
		v66.value = v41
		v66.onValueChanged = p_u_33.onRotateChanged
		v66.width = UDim.new(1, 0)
		v66.position = UDim2.new(0, 0, 0.5, 0)
		v66.anchorPoint = Vector2.new(0, 0.5)
		v66.NextSelectionUp = p_u_33.timeSliderRef
		v66[v_u_2.Ref] = p_u_33.rotationSliderRef
		v53.RotationSlider = v64(v65, v66)
		v49.Levers = v50(v51, v52, v53)
		v45.TopSection = v46(v47, v48, v49)
		return v42(v43, v44, v45)
	end)
end
function v18.renderAlertLocalized(p_u_68, p_u_69) -- name: renderAlertLocalized
	-- upvalues: (copy) v_u_2, (copy) v_u_12, (copy) v_u_13
	local v70 = v_u_2.createElement
	local v71 = v_u_12
	local v72 = {
		["title"] = nil,
		["buttonStackInfo"] = nil,
		["middleContent"] = nil,
		["screenSize"] = nil,
		["defaultChildRef"] = nil,
		["isMiddleContentFocusable"] = true,
		["title"] = p_u_69.titleText or ""
	}
	local v73 = {}
	local v74 = {}
	local v75 = {
		["props"] = nil,
		["isDefaultChild"] = true,
		["props"] = {
			["onActivated"] = p_u_68.onCancelPressed,
			["text"] = p_u_69.cancelButtonText
		}
	}
	local v76 = {
		["buttonType"] = nil,
		["props"] = nil,
		["isDefaultChild"] = false,
		["buttonType"] = v_u_13.PrimarySystem,
		["props"] = {
			["onActivated"] = p_u_68.onUpdatePressed,
			["text"] = p_u_69.updateButtonText
		}
	}
	__set_list(v74, 1, {v75, v76})
	v73.buttons = v74
	v72.buttonStackInfo = v73
	function v72.middleContent() -- name: middleContent
		-- upvalues: (copy) p_u_68, (copy) p_u_69
		return p_u_68:renderMiddle(p_u_69)
	end
	v72.screenSize = p_u_68.props.screenSize
	v72.defaultChildRef = p_u_68.props.defaultChildRef
	return v70(v71, v72)
end
local function v_u_77() -- name: GetLocalizedStrings
	-- upvalues: (copy) v_u_5
	return {
		["cancelButtonText"] = v_u_5:FormatByKey("CoreScripts.EmoteThumbnailEditor.Action.Cancel"),
		["updateButtonText"] = v_u_5:FormatByKey("CoreScripts.EmoteThumbnailEditor.Action.Update"),
		["titleText"] = v_u_5:FormatByKey("CoreScripts.EmoteThumbnailEditor.Heading.EditThumbnail"),
		["rotationLabelText"] = v_u_5:FormatByKey("CoreScripts.EmoteThumbnailEditor.Label.Rotation"),
		["timeLabelText"] = v_u_5:FormatByKey("CoreScripts.EmoteThumbnailEditor.Label.Time")
	}
end
function v18.render(p78) -- name: render
	-- upvalues: (copy) v_u_77
	return p78:renderAlertLocalized((v_u_77()))
end
return v18