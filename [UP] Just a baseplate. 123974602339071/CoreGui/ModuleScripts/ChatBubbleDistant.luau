-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.Components.ChatBubbleDistant
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Otter)
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.t)
local v_u_5 = require(v1.Packages.Cryo)
local v6 = script.Parent.Parent
local v7 = require(v6.Types)
local v_u_8 = require(v6.Helpers.getSizeSpringFromSettings)
local v_u_9 = require(v6.Helpers.getTransparencySpringFromSettings)
local v_u_10 = require(v1.Workspace.Packages.Style).AppFonts
game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v11 = v_u_3.PureComponent:extend("ChatBubbleDistant")
v11.validateProps = v4.strictInterface({
	["width"] = v4.optional(v4.number),
	["height"] = v4.optional(v4.number),
	["fadingOut"] = v4.optional(v4.boolean),
	["onFadeOut"] = v4.optional(v4.callback),
	["chatSettings"] = v7.IChatSettings,
	["renderInsert"] = v4.optional(v4.callback),
	["insertSize"] = v4.optional(v4.Vector2)
})
v11.defaultProps = {
	["width"] = 32,
	["height"] = 16
}
function v11.init(p_u_12, p13) -- name: init
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v14, v15 = v_u_3.createBinding(0)
	p_u_12.width = v14
	p_u_12.updateWidth = v15
	p_u_12.widthMotor = v_u_2.createSingleMotor(0)
	p_u_12.widthMotor:onStep(function(p16)
		-- upvalues: (copy) p_u_12
		p_u_12.updateWidth((math.round(p16)))
	end)
	local v17 = v_u_3.createBinding
	local v18 = p13.height
	if p13.renderInsert then
		local v19 = p13.insertSize.Y
		v18 = math.max(v18, v19)
	end
	local v20, v21 = v17(v18 + p13.chatSettings.Padding * 2)
	p_u_12.height = v20
	p_u_12.updateHeight = v21
	p_u_12.frameSize = v_u_3.joinBindings({ p_u_12.width, p_u_12.height }):map(function(p22)
		return UDim2.fromOffset(p22[1], p22[2])
	end)
	local v23, v24 = v_u_3.createBinding(1)
	p_u_12.transparency = v23
	p_u_12.updateTransparency = v24
	p_u_12.transparencyMotor = v_u_2.createSingleMotor(1)
	p_u_12.transparencyMotor:onStep(p_u_12.updateTransparency)
	if p13.fadingOut then
		p_u_12:fadeOut()
	end
end
function v11.getDerivedStateFromProps(p25, p26) -- name: getDerivedStateFromProps
	local v27 = p25.chatSettings
	local v28
	if p25.renderInsert then
		v28 = p25.width + p25.insertSize.X + v27.Padding * 2
	else
		v28 = p25.width + v27.Padding * 2
	end
	local v29 = p25.height
	if p25.renderInsert then
		local v30 = p25.insertSize.Y
		v29 = math.max(v29, v30)
	end
	local v31 = v29 + p25.chatSettings.Padding * 2
	return (v28 ~= p26.fullWidth or v31 ~= p26.fullHeight) and {
		["fullWidth"] = v28,
		["fullHeight"] = v31
	} or nil
end
function v11.render(p32) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_10
	local v33 = p32.props.chatSettings
	local v34 = v33.BackgroundImage
	local v35 = v33.BackgroundGradient
	local v36 = p32.props.renderInsert and (p32.props.insertSize.X or 0) or 0
	local v37 = v_u_3.createElement
	local v38 = "Frame"
	local v39 = {
		["AnchorPoint"] = nil,
		["Size"] = nil,
		["Position"] = nil,
		["Transparency"] = 1,
		["AnchorPoint"] = Vector2.new(0.5, 1),
		["Size"] = UDim2.fromOffset(p32.state.fullWidth, p32.state.fullHeight),
		["Position"] = UDim2.new(0.5, 0, 1, -8)
	}
	local v40 = {
		["Scale"] = v_u_3.createElement("UIScale", {
			["Scale"] = 0.75
		})
	}
	local v41 = v33.TailVisible
	if v41 then
		v41 = v_u_3.createElement("ImageLabel", {
			["AnchorPoint"] = nil,
			["BackgroundTransparency"] = 1,
			["Position"] = nil,
			["Size"] = nil,
			["Image"] = "rbxasset://textures/ui/InGameChat/Caret.png",
			["ImageColor3"] = nil,
			["ImageTransparency"] = nil,
			["AnchorPoint"] = Vector2.new(0.5, 0),
			["Position"] = UDim2.new(0.5, 0, 1, -1),
			["Size"] = UDim2.fromOffset(12, 8),
			["ImageColor3"] = v33.BackgroundColor3,
			["ImageTransparency"] = p32.transparency
		})
	end
	v40.Carat = v41
	local v42 = v_u_3.createElement
	local v43 = "ImageLabel"
	local v44 = v_u_5.Dictionary.join(v34, {
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = nil,
		["BorderSizePixel"] = 0,
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["ClipsDescendants"] = true,
		["ImageTransparency"] = nil,
		["Size"] = p32.frameSize,
		["BackgroundColor3"] = v33.BackgroundColor3,
		["BackgroundTransparency"] = v34.Image == "" and (p32.transparency or 1) or 1,
		["AnchorPoint"] = Vector2.new(0.5, 0),
		["Position"] = UDim2.new(0.5, 0, 0, 0),
		["ImageTransparency"] = p32.transparency
	})
	local v45 = {}
	local v46 = v33.CornerEnabled
	if v46 then
		v46 = v_u_3.createElement("UICorner", {
			["CornerRadius"] = v33.CornerRadius
		})
	end
	v45.UICorner = v46
	local v47 = v_u_3.createElement
	local v48 = "Frame"
	local v49 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.fromScale(1, 1)
	}
	local v50 = {
		["Padding"] = v_u_3.createElement("UIPadding", {
			["PaddingTop"] = UDim.new(0, v33.Padding),
			["PaddingRight"] = UDim.new(0, v33.Padding),
			["PaddingBottom"] = UDim.new(0, v33.Padding),
			["PaddingLeft"] = UDim.new(0, v33.Padding)
		}),
		["UIListLayout"] = v_u_3.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
	}
	local v51 = p32.props.renderInsert
	if v51 then
		v51 = p32.props.renderInsert()
	end
	v50.Insert = v51
	v50.Ellipsis = v_u_3.createElement("TextLabel", {
		["BackgroundTransparency"] = 1,
		["Text"] = "\226\128\166",
		["TextColor3"] = nil,
		["TextTransparency"] = nil,
		["Font"] = nil,
		["TextScaled"] = true,
		["Size"] = nil,
		["LayoutOrder"] = 2,
		["TextColor3"] = v33.TextColor3,
		["TextTransparency"] = p32.transparency,
		["Font"] = v_u_10.default:getBlack(),
		["Size"] = UDim2.new(1, -v36, 1, 0)
	})
	v45.Contents = v47(v48, v49, v50)
	local v52 = v35.Enabled
	if v52 then
		v52 = v_u_3.createElement("UIGradient", v35)
	end
	v45.Gradient = v52
	v40.RoundedFrame = v42(v43, v44, v45)
	return v37(v38, v39, v40)
end
function v11.fadeOut(p_u_53) -- name: fadeOut
	-- upvalues: (copy) v_u_9
	if not p_u_53.isFadingOut then
		p_u_53.isFadingOut = true
		p_u_53.transparencyMotor:onComplete(function()
			-- upvalues: (copy) p_u_53
			if p_u_53.props.onFadeOut then
				p_u_53.props.onFadeOut()
			end
		end)
		local v54 = v_u_9(p_u_53.props.chatSettings)
		p_u_53.transparencyMotor:setGoal(v54(1))
	end
end
function v11.didUpdate(p55, _, p56) -- name: didUpdate
	-- upvalues: (copy) v_u_8
	if p55.props.fadingOut then
		p55:fadeOut()
	else
		if p55.state.fullHeight ~= p56.fullHeight then
			p55.updateHeight(p55.state.fullHeight)
		end
		if p55.state.fullWidth ~= p56.fullWidth then
			local v57 = v_u_8(p55.props.chatSettings)
			p55.widthMotor:setGoal(v57(p55.state.fullWidth))
		end
	end
end
function v11.didMount(p58) -- name: didMount
	-- upvalues: (copy) v_u_8, (copy) v_u_9
	if not p58.props.fadingOut then
		local v59 = p58.props.chatSettings
		local v60 = v_u_8(v59)
		local v61 = v_u_9(v59)
		p58.transparencyMotor:setGoal(v61(p58.props.chatSettings.Transparency))
		p58.widthMotor:setGoal(v60(p58.state.fullWidth))
	end
end
function v11.willUnmount(p62) -- name: willUnmount
	p62.transparencyMotor:destroy()
	p62.widthMotor:destroy()
end
return v11