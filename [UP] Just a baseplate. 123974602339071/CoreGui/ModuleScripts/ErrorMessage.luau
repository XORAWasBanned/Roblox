-- Path: CoreGui.RobloxGui.Modules.EmotesMenu.Components.ErrorMessage
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.RoactRodux)
local v4 = script.Parent.Parent
local v5 = v4.Actions
local v_u_6 = require(v5.HideError)
local v_u_7 = require(v4.Constants)
local v8 = v_u_2.PureComponent:extend("ErrorMessage")
function v8.render(p_u_9) -- name: render
	-- upvalues: (copy) v_u_7, (copy) v_u_2
	local v10 = v_u_7.Layouts[p_u_9.props.layout]
	local v11 = v_u_2.createElement
	local v13 = {
		["Size"] = v10.ErrorFrameSize,
		["Position"] = v10.ErrorFramePosition,
		["BackgroundColor3"] = v_u_7.Colors.Black,
		["BackgroundTransparency"] = v_u_7.ErrorFrameBackgroundTransparency,
		["BorderSizePixel"] = v_u_7.ErrorFrameBorderSize,
		["Selectable"] = false,
		["Visible"] = p_u_9.props.displayOptions.errorVisible,
		[v_u_2.Event.TouchTap] = function()
			-- upvalues: (copy) p_u_9
			p_u_9.props.close()
		end,
		[v_u_2.Event.InputBegan] = function(_, p12)
			-- upvalues: (copy) p_u_9
			if p12.UserInputType == Enum.UserInputType.MouseButton1 then
				p_u_9.props.close()
			end
		end
	}
	local v14 = {
		["AsspectRatioConstraint"] = v_u_2.createElement("UIAspectRatioConstraint", {
			["AspectRatio"] = v10.ErrorFrameAspectRatio
		}),
		["SizeConstraint"] = v_u_2.createElement("UISizeConstraint", {
			["MinSize"] = v10.ErrorFrameMinSize,
			["MaxSize"] = v10.ErrorFrameMaxSize
		}),
		["ErrorIcon"] = v_u_2.createElement("ImageLabel", {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Image"] = nil,
			["BackgroundTransparency"] = 1,
			["AnchorPoint"] = Vector2.new(0, 0.5),
			["Position"] = UDim2.new(0, v10.ErrorIconOffset, 0.5, 0),
			["Size"] = UDim2.new(0.2, -v10.ErrorIconOffset * 2, 1, -v10.ErrorIconOffset * 2),
			["Image"] = v10.ErrorIcon
		}, {
			["AsspectRatioConstraint"] = v_u_2.createElement("UIAspectRatioConstraint", {
				["AspectRatio"] = 1
			})
		})
	}
	local v15 = v_u_2.createElement
	local v16 = {
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["Text"] = nil,
		["TextScaled"] = true,
		["TextSize"] = nil,
		["TextColor3"] = nil,
		["TextXAlignment"] = nil,
		["Font"] = nil,
		["BackgroundTransparency"] = 1,
		["AnchorPoint"] = Vector2.new(0, 0.5),
		["Position"] = UDim2.new(0.2, -v10.ErrorIconOffset, 0.5, 0),
		["Size"] = UDim2.new(0.8, 0, 1, 0),
		["Text"] = p_u_9.props.displayOptions.errorText,
		["TextSize"] = v10.ErrorTextSize,
		["TextColor3"] = v_u_7.Colors.White,
		["TextXAlignment"] = Enum.TextXAlignment.Left,
		["Font"] = v10.ErrorTextFont
	}
	local v17 = {
		["SizeConstraint"] = v_u_2.createElement("UISizeConstraint", {
			["MaxSize"] = Vector2.new(v10.ErrorFrameMaxSize.X, v10.ErrorTextSize + v_u_7.TextPadding)
		}),
		["TextSizeConstraint"] = v_u_2.createElement("UITextSizeConstraint", {
			["MaxTextSize"] = v10.ErrorTextSize
		})
	}
	v14.ErrorText = v15("TextLabel", v16, v17)
	return v11("Frame", v13, v14)
end
return v3.connect(function(p18) -- name: mapStateToProps
	return {
		["displayOptions"] = p18.displayOptions,
		["layout"] = p18.layout
	}
end, function(p_u_19) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_6
	return {
		["close"] = function() -- name: close
			-- upvalues: (copy) p_u_19, (ref) v_u_6
			return p_u_19(v_u_6())
		end
	}
end)(v8)