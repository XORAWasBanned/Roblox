-- Path: CoreGui.RobloxGui.Modules.EmotesMenu.Components.WheelText
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("StarterPlayer")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = script.Parent.Parent
local v_u_6 = require(v5.Constants)
local v_u_7 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_8 = require(v5.Flags.FFlagFixEmotesMenuAvailability)
local v9 = v_u_3.PureComponent:extend("WheelText")
function v9.getWheelText(p10) -- name: getWheelText
	-- upvalues: (copy) v_u_2, (copy) v_u_8, (copy) v_u_7, (copy) v_u_6
	local v11 = p10.props.emotesPage.currentEmotes
	local v12 = p10.props.locale
	local v13 = p10.props.emotesPage.numberEmotesLoaded
	if next(v11) == nil then
		if v_u_2.UserEmotesEnabled and (v_u_8 or v13 == 0) then
			return v_u_7:FormatByKeyForLocale(v_u_6.LocalizationKeys.NoEmotesEquipped, v12)
		else
			return v_u_7:FormatByKeyForLocale(v_u_6.LocalizationKeys.EmotesDisabled, v12)
		end
	else
		return v11[p10.props.emotesWheel.focusedSegmentIndex] or v_u_7:FormatByKeyForLocale(v_u_6.LocalizationKeys.SelectAnEmote, v12)
	end
end
function v9.render(p14) -- name: render
	-- upvalues: (copy) v_u_6, (copy) v_u_3
	local v15 = v_u_6.Layouts[p14.props.layout]
	local v16 = p14:getWheelText()
	local v17 = v_u_3.createElement
	local v18 = {
		["AnchorPoint"] = nil,
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 1,
		["Text"] = nil,
		["TextScaled"] = true,
		["TextSize"] = nil,
		["TextColor3"] = nil,
		["Font"] = nil,
		["ZIndex"] = 5,
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Size"] = UDim2.new(v_u_6.InnerCircleSizeRatio, -v_u_6.TextPadding, v_u_6.InnerCircleSizeRatio, -v_u_6.TextPadding),
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["Text"] = v16,
		["TextSize"] = v15.MiddleTextSize,
		["TextColor3"] = v_u_6.Colors.White,
		["Font"] = v15.MiddleTextFont
	}
	local v19 = {
		["TextSizeConstraint"] = v_u_3.createElement("UITextSizeConstraint", {
			["MaxTextSize"] = v15.MiddleTextSize
		})
	}
	return v17("TextLabel", v18, v19)
end
return v4.connect(function(p20) -- name: mapStateToProps
	return {
		["emotesWheel"] = p20.emotesWheel,
		["emotesPage"] = p20.emotesPage,
		["layout"] = p20.layout,
		["locale"] = p20.locale
	}
end, nil)(v9)