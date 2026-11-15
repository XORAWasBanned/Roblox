-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.Components.ChatBubble
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("TextService")
local v_u_3 = game:GetService("TextChatService")
local v_u_4 = require(v1.Packages.Otter)
local v_u_5 = require(v1.Packages.Roact)
local v6 = require(v1.Packages.RoactRodux)
local v7 = require(v1.Packages.t)
local v_u_8 = require(v1.Packages.Cryo)
local v9 = script.Parent.Parent
local v10 = require(v9.Types)
local v_u_11 = require(v9.Helpers.getSizeSpringFromSettings)
local v_u_12 = require(v9.Helpers.getTransparencySpringFromSettings)
local v_u_13 = game:GetService("CoreGui")
local v14 = v_u_5.PureComponent:extend("ChatBubble")
v14.validateProps = v7.strictInterface({
	["messageId"] = v7.string,
	["fadingOut"] = v7.optional(v7.boolean),
	["onFadeOut"] = v7.optional(v7.callback),
	["isMostRecent"] = v7.optional(v7.boolean),
	["theme"] = v7.optional(v7.string),
	["renderInsert"] = v7.optional(v7.callback),
	["insertSize"] = v7.optional(v7.Vector2),
	["chatSettings"] = v10.IChatSettings,
	["text"] = v7.string,
	["timestamp"] = v7.number
})
v14.defaultProps = {
	["theme"] = "Light",
	["isMostRecent"] = true
}
function v14.init(p_u_15) -- name: init
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_3
	local v16, v17 = v_u_5.createBinding(0)
	p_u_15.width = v16
	p_u_15.updateWidth = v17
	p_u_15.widthMotor = v_u_4.createSingleMotor(0)
	p_u_15.widthMotor:onStep(function(p18)
		-- upvalues: (copy) p_u_15
		p_u_15.updateWidth((math.round(p18)))
	end)
	local v19, v20 = v_u_5.createBinding(0)
	p_u_15.height = v19
	p_u_15.updateHeight = v20
	p_u_15.heightMotor = v_u_4.createSingleMotor(0)
	p_u_15.heightMotor:onStep(function(p21)
		-- upvalues: (copy) p_u_15
		p_u_15.updateHeight((math.round(p21)))
	end)
	local v22, v23 = v_u_5.createBinding(1)
	p_u_15.transparency = v22
	p_u_15.updateTransparency = v23
	p_u_15.transparencyMotor = v_u_4.createSingleMotor(1)
	p_u_15.transparencyMotor:onStep(p_u_15.updateTransparency)
	p_u_15.size = v_u_5.joinBindings({ p_u_15.width, p_u_15.height }):map(function(p24)
		return UDim2.fromOffset(p24[1], p24[2])
	end)
	p_u_15.mockSizingLabel = nil
	p_u_15.isRichTextEnabled = v_u_3.ChatVersion == Enum.ChatVersion.TextChatService
end
function v14.getBoundsFromSizingLabel(_, p25, p26, p27, p28) -- name: getBoundsFromSizingLabel
	-- upvalues: (copy) v_u_13
	local v29 = Instance.new("ScreenGui")
	v29.Enabled = false
	v29.Name = "RichTextSizingLabel"
	local v30 = Instance.new("TextLabel")
	v30.TextWrapped = true
	v30.RichText = true
	v30.Parent = v29
	v29.Parent = v_u_13
	v30.Text = p25
	v30.TextSize = p26
	v30.Font = p27
	v30.Size = UDim2.fromOffset(p28.X, p28.Y)
	local v31 = v30.TextBounds
	v30.Parent:Destroy()
	return v31
end
function v14.getTextBounds(p32) -- name: getTextBounds
	-- upvalues: (copy) v_u_2
	local v33 = p32.props.chatSettings
	local v34 = Vector2.new(v33.Padding * 4, v33.Padding * 2)
	Vector2.new(0, 0)
	local v35
	if p32.isRichTextEnabled then
		v35 = p32:getBoundsFromSizingLabel(p32.props.text, v33.TextSize, v33.Font, Vector2.new(v33.MaxWidth, 10000))
	else
		v35 = v_u_2:GetTextSize(p32.props.text, v33.TextSize, v33.Font, Vector2.new(v33.MaxWidth, 10000))
	end
	return v35 + v34
end
function v14.render(p36) -- name: render
	-- upvalues: (copy) v_u_5, (copy) v_u_8
	local v37 = p36.props.chatSettings
	local v38 = v37.BackgroundImage
	local v39 = v37.BackgroundGradient
	local v40 = p36.props.renderInsert and (p36.props.insertSize.X + v37.Padding or 0) or 0
	local v41 = v_u_5.createElement
	local v42 = "Frame"
	local v43 = {
		["LayoutOrder"] = nil,
		["AnchorPoint"] = nil,
		["Size"] = nil,
		["Position"] = nil,
		["Transparency"] = 1,
		["LayoutOrder"] = p36.props.timestamp,
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Size"] = p36.size,
		["Position"] = UDim2.fromScale(1, 0.5)
	}
	local v44 = {
		["Layout"] = v_u_5.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["Padding"] = UDim.new(0, -1)
		})
	}
	local v45 = v_u_5.createElement
	local v46 = "ImageLabel"
	local v47 = v_u_8.Dictionary.join(v38, {
		["LayoutOrder"] = 1,
		["BackgroundColor3"] = nil,
		["AnchorPoint"] = nil,
		["Size"] = nil,
		["BorderSizePixel"] = 0,
		["Position"] = nil,
		["BackgroundTransparency"] = nil,
		["ClipsDescendants"] = true,
		["ImageTransparency"] = nil,
		["BackgroundColor3"] = v37.BackgroundColor3,
		["AnchorPoint"] = Vector2.new(0.5, 0),
		["Size"] = UDim2.fromScale(1, 1),
		["Position"] = UDim2.new(0.5, 0, 0, 0),
		["BackgroundTransparency"] = v38.Image ~= "" and 1 or p36.transparency,
		["ImageTransparency"] = p36.transparency
	})
	local v48 = {}
	local v49 = v37.CornerEnabled
	if v49 then
		v49 = v_u_5.createElement("UICorner", {
			["CornerRadius"] = v37.CornerRadius
		})
	end
	v48.UICorner = v49
	v48.UIListLayout = v_u_5.createElement("UIListLayout", {
		["FillDirection"] = Enum.FillDirection.Horizontal,
		["SortOrder"] = Enum.SortOrder.LayoutOrder,
		["VerticalAlignment"] = Enum.VerticalAlignment.Bottom,
		["Padding"] = UDim.new(0, v37.Padding)
	})
	v48.Padding = v_u_5.createElement("UIPadding", {
		["PaddingTop"] = UDim.new(0, v37.Padding),
		["PaddingRight"] = UDim.new(0, v37.Padding),
		["PaddingBottom"] = UDim.new(0, v37.Padding),
		["PaddingLeft"] = UDim.new(0, v37.Padding)
	})
	local v50 = p36.props.renderInsert
	if v50 then
		v50 = p36.props.renderInsert()
	end
	v48.Insert = v50
	v48.Text = v_u_5.createElement("TextLabel", {
		["Text"] = nil,
		["Size"] = nil,
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 1,
		["Font"] = nil,
		["TextColor3"] = nil,
		["TextSize"] = nil,
		["TextTransparency"] = nil,
		["TextWrapped"] = true,
		["AutoLocalize"] = false,
		["LayoutOrder"] = 2,
		["RichText"] = nil,
		["Text"] = p36.props.text,
		["Size"] = UDim2.new(1, -v40, 1, 0),
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Position"] = UDim2.fromScale(0.5, 0.5),
		["Font"] = v37.Font,
		["TextColor3"] = v37.TextColor3,
		["TextSize"] = v37.TextSize,
		["TextTransparency"] = p36.transparency,
		["RichText"] = p36.isRichTextEnabled
	})
	local v51 = v39.Enabled
	if v51 then
		v51 = v_u_5.createElement("UIGradient", v39)
	end
	v48.Gradient = v51
	v44.Frame = v45(v46, v47, v48)
	local v52 = p36.props.isMostRecent and (v37.TailVisible and p36.props.showCarat)
	if v52 then
		v52 = v_u_5.createElement("ImageLabel", {
			["LayoutOrder"] = 2,
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Image"] = "rbxasset://textures/ui/InGameChat/Caret.png",
			["ImageColor3"] = nil,
			["ImageTransparency"] = nil,
			["Size"] = UDim2.fromOffset(9, 6),
			["ImageColor3"] = v37.BackgroundColor3,
			["ImageTransparency"] = p36.transparency
		})
	end
	v44.Carat = v52
	return v41(v42, v43, v44)
end
function v14.fadeOut(p_u_53) -- name: fadeOut
	-- upvalues: (copy) v_u_12
	if not p_u_53.isFadingOut then
		p_u_53.isFadingOut = true
		p_u_53.transparencyMotor:onComplete(function()
			-- upvalues: (copy) p_u_53
			if p_u_53.props.onFadeOut then
				p_u_53.props.onFadeOut(p_u_53.props.messageId)
			end
		end)
		local v54 = v_u_12(p_u_53.props.chatSettings)
		p_u_53.transparencyMotor:setGoal(v54(1))
	end
end
function v14.didUpdate(p55, p56) -- name: didUpdate
	-- upvalues: (copy) v_u_11
	if p55.props.fadingOut then
		p55:fadeOut()
	end
	if p56.text ~= p55.props.text or (p56.chatSettings ~= p55.props.chatSettings or (p56.renderInsert ~= p55.props.renderInsert or p56.insertSize ~= p55.props.insertSize)) then
		local v57 = p55:getTextBounds()
		local v58 = v_u_11(p55.props.chatSettings)
		local v59 = p55.props.chatSettings.Padding
		local v60 = v57.X
		local v61 = v57.Y
		if p55.props.renderInsert then
			v60 = v60 + (p55.props.insertSize.X + v59)
			local v62 = p55.props.insertSize.Y + v59 * 2
			v61 = math.max(v61, v62)
		end
		p55.heightMotor:setGoal(v58(v61))
		p55.widthMotor:setGoal(v58(v60))
	end
end
function v14.didMount(p63) -- name: didMount
	-- upvalues: (copy) v_u_11, (copy) v_u_12, (copy) v_u_4
	p63.isMounted = true
	local v64 = p63:getTextBounds()
	local v65 = p63.props.chatSettings
	local v66 = v_u_11(v65)
	local v67 = v_u_12(v65)
	local v68 = v64.X
	local v69 = v64.Y
	if p63.props.renderInsert then
		v68 = v68 + (p63.props.insertSize.X + v65.Padding)
		local v70 = p63.props.insertSize.Y + v65.Padding * 2
		v69 = math.max(v69, v70)
	end
	if p63.props.isMostRecent then
		p63.heightMotor:setGoal(v66(v69))
		p63.widthMotor:setGoal(v_u_4.instant(v68))
	else
		p63.heightMotor:setGoal(v66(v69))
		p63.widthMotor:setGoal(v66(v68))
	end
	p63.transparencyMotor:setGoal(v67(v65.Transparency))
end
function v14.willUnmount(p71) -- name: willUnmount
	p71.isMounted = false
	p71.transparencyMotor:destroy()
	p71.heightMotor:destroy()
	p71.widthMotor:destroy()
end
return v6.connect(function(p72, p73) -- name: mapStateToProps
	local v74 = p72.messages[p73.messageId]
	return {
		["text"] = v74 and (v74.text or "") or "",
		["timestamp"] = v74 and v74.timestamp or 0
	}
end)(v14)