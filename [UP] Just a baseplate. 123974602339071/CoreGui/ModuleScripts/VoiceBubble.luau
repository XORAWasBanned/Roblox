-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.Components.VoiceBubble
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Otter)
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.t)
local v_u_5 = require(v1.Packages.Cryo)
local v6 = script.Parent.Parent
local v7 = require(v6.Types)
local v_u_8 = require(v6.Helpers.getSizeSpringFromSettings)
local v_u_9 = require(v6.Helpers.getTransparencySpringFromSettings)
game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v10 = v_u_3.PureComponent:extend("VoiceBubble")
v10.validateProps = v4.strictInterface({
	["fadingOut"] = v4.optional(v4.boolean),
	["onFadeOut"] = v4.optional(v4.callback),
	["chatSettings"] = v7.IChatSettings,
	["renderInsert"] = v4.optional(v4.callback),
	["insertSize"] = v4.optional(v4.Vector2),
	["isDistant"] = v4.optional(v4.boolean)
})
function v10.init(p_u_11, p12) -- name: init
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v13, v14 = v_u_3.createBinding(0)
	p_u_11.width = v13
	p_u_11.updateWidth = v14
	p_u_11.widthMotor = v_u_2.createSingleMotor(0)
	p_u_11.widthMotor:onStep(function(p15)
		-- upvalues: (copy) p_u_11
		p_u_11.updateWidth((math.round(p15)))
	end)
	p_u_11.frameSize = p_u_11.width:map(function(p16)
		-- upvalues: (copy) p_u_11
		if p_u_11.props.insertSize then
			return UDim2.fromOffset(p16, p_u_11.props.insertSize.Y + p_u_11.props.chatSettings.Padding * 2)
		else
			return UDim2.fromOffset(p16, 0)
		end
	end)
	local v17, v18 = v_u_3.createBinding(1)
	p_u_11.transparency = v17
	p_u_11.updateTransparency = v18
	p_u_11.transparencyMotor = v_u_2.createSingleMotor(1)
	p_u_11.transparencyMotor:onStep(p_u_11.updateTransparency)
	if p12.fadingOut then
		p_u_11:fadeOut()
	end
end
function v10.getDerivedStateFromProps(p19, p20) -- name: getDerivedStateFromProps
	local v21 = p19.chatSettings
	local v22 = not p19.insertSize and 0 or p19.insertSize.X + v21.Padding * 2
	return v22 ~= p20.fullWidth and {
		["fullWidth"] = v22
	} or nil
end
function v10.render(p23) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_5
	local v24 = p23.props.chatSettings
	local v25 = v24.BackgroundImage
	local v26 = v24.BackgroundGradient
	local v27 = not p23.props.insertSize and 0 or p23.props.insertSize.Y + v24.Padding * 2
	local v28 = v_u_3.createElement
	local v29 = "Frame"
	local v30 = {
		["AnchorPoint"] = nil,
		["Size"] = nil,
		["Position"] = nil,
		["Transparency"] = 1,
		["AnchorPoint"] = Vector2.new(0.5, 1),
		["Size"] = UDim2.fromOffset(p23.state.fullWidth, v27),
		["Position"] = UDim2.new(0.5, 0, 1, -8)
	}
	local v31 = {
		["Scale"] = v_u_3.createElement("UIScale", {
			["Scale"] = p23.props.isDistant and 0.75 or 1
		})
	}
	local v32 = v24.TailVisible
	if v32 then
		v32 = v_u_3.createElement("ImageLabel", {
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
			["ImageColor3"] = v24.BackgroundColor3,
			["ImageTransparency"] = p23.transparency
		})
	end
	v31.Carat = v32
	local v33 = v_u_3.createElement
	local v34 = "ImageLabel"
	local v35 = v_u_5.Dictionary.join(v25, {
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = nil,
		["BorderSizePixel"] = 0,
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["ClipsDescendants"] = true,
		["ImageTransparency"] = nil,
		["Size"] = p23.frameSize,
		["BackgroundColor3"] = v24.BackgroundColor3,
		["BackgroundTransparency"] = v25.Image == "" and (p23.transparency or 1) or 1,
		["AnchorPoint"] = Vector2.new(0.5, 0),
		["Position"] = UDim2.new(0.5, 0, 0, 0),
		["ImageTransparency"] = p23.transparency
	})
	local v36 = {}
	local v37 = v24.CornerEnabled
	if v37 then
		v37 = v_u_3.createElement("UICorner", {
			["CornerRadius"] = v24.CornerRadius
		})
	end
	v36.UICorner = v37
	local v38 = v_u_3.createElement
	local v39 = "Frame"
	local v40 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.fromScale(1, 1)
	}
	local v41 = {
		["Padding"] = v_u_3.createElement("UIPadding", {
			["PaddingTop"] = UDim.new(0, v24.Padding),
			["PaddingRight"] = UDim.new(0, v24.Padding),
			["PaddingBottom"] = UDim.new(0, v24.Padding),
			["PaddingLeft"] = UDim.new(0, v24.Padding)
		})
	}
	local v42 = p23.props.renderInsert
	if v42 then
		v42 = p23.props.renderInsert()
	end
	v41.Insert = v42
	v36.Contents = v38(v39, v40, v41)
	local v43 = v26.Enabled
	if v43 then
		v43 = v_u_3.createElement("UIGradient", v26)
	end
	v36.Gradient = v43
	v31.RoundedFrame = v33(v34, v35, v36)
	return v28(v29, v30, v31)
end
function v10.fadeOut(p_u_44) -- name: fadeOut
	-- upvalues: (copy) v_u_9
	if not p_u_44.isFadingOut then
		p_u_44.isFadingOut = true
		p_u_44.transparencyMotor:onComplete(function()
			-- upvalues: (copy) p_u_44
			if p_u_44.props.onFadeOut then
				p_u_44.props.onFadeOut()
			end
		end)
		local v45 = v_u_9(p_u_44.props.chatSettings)
		p_u_44.transparencyMotor:setGoal(v45(1))
	end
end
function v10.didUpdate(p46, _, p47) -- name: didUpdate
	-- upvalues: (copy) v_u_8
	if p46.props.fadingOut then
		p46:fadeOut()
	elseif p46.state.fullWidth ~= p47.fullWidth then
		local v48 = v_u_8(p46.props.chatSettings)
		p46.widthMotor:setGoal(v48(p46.state.fullWidth))
	end
end
function v10.didMount(p49) -- name: didMount
	-- upvalues: (copy) v_u_8, (copy) v_u_9
	if not p49.props.fadingOut then
		local v50 = p49.props.chatSettings
		local v51 = v_u_8(v50)
		local v52 = v_u_9(v50)
		p49.transparencyMotor:setGoal(v52(p49.props.chatSettings.Transparency))
		p49.widthMotor:setGoal(v51(p49.state.fullWidth))
	end
end
function v10.willUnmount(p53) -- name: willUnmount
	p53.transparencyMotor:destroy()
	p53.widthMotor:destroy()
end
return v10