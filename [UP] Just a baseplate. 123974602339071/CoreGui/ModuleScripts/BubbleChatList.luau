-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.Components.BubbleChatList
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = require(v1.Packages.t)
local v_u_6 = require(script.Parent.ChatBubble)
local v7 = require(script.Parent.Parent.Types)
game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v8 = v_u_3.Component:extend("BubbleChatList")
v8.validateProps = v5.strictInterface({
	["userId"] = v5.string,
	["isVisible"] = v5.optional(v5.boolean),
	["theme"] = v5.optional(v5.string),
	["onLastBubbleFadeOut"] = v5.optional(v5.callback),
	["chatSettings"] = v7.IChatSettings,
	["renderFirstInsert"] = v5.optional(v5.callback),
	["insertSize"] = v5.optional(v5.Vector2),
	["messageIds"] = v5.array(v5.string)
})
v8.defaultProps = {
	["theme"] = "Light"
}
function v8.getDerivedStateFromProps(p9, p10) -- name: getDerivedStateFromProps
	-- upvalues: (copy) v_u_2
	local v11 = {}
	if p10.bubbles then
		for _, v12 in ipairs(p10.bubbles) do
			if v_u_2.List.find(p9.messageIds, v12.messageId) then
				continue
			end
			local v13 = {
				["messageId"] = nil,
				["fadingOut"] = true,
				["messageId"] = v12.messageId
			}
			table.insert(v11, v13)
		end
	end
	for _, v14 in ipairs(p9.messageIds) do
		table.insert(v11, {
			["messageId"] = nil,
			["fadingOut"] = false,
			["messageId"] = v14
		})
	end
	return {
		["bubbles"] = v11
	}
end
function v8.init(p_u_15, p16) -- name: init
	-- upvalues: (copy) v_u_2
	if (not p16.messageIds or #p16.messageIds == 0) and p16.onLastBubbleFadeOut then
		p16.onLastBubbleFadeOut()
	end
	function p_u_15.onBubbleFadeOut(p_u_17)
		-- upvalues: (ref) v_u_2, (copy) p_u_15
		local v19 = v_u_2.List.filter(p_u_15.state.bubbles, function(p18)
			-- upvalues: (copy) p_u_17
			return p18.messageId ~= p_u_17
		end)
		if #v19 == 0 and p_u_15.props.onLastBubbleFadeOut then
			p_u_15.props.onLastBubbleFadeOut()
		else
			p_u_15:setState({
				["bubbles"] = v19
			})
		end
	end
end
function v8.render(p20) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_6
	local v21 = {}
	local v22 = p20.props.chatSettings
	v21.Layout = v_u_3.createElement("UIListLayout", {
		["SortOrder"] = Enum.SortOrder.LayoutOrder,
		["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
		["VerticalAlignment"] = Enum.VerticalAlignment.Bottom,
		["Padding"] = UDim.new(0, v22.BubblesSpacing)
	})
	local v23 = v22.TailVisible and p20.props.showCarat
	if v23 then
		v23 = v_u_3.createElement("UIPadding", {
			["PaddingBottom"] = UDim.new(0, 8)
		})
	end
	v21.CaretPadding = v23
	for v24, v25 in ipairs(p20.state.bubbles) do
		local v26 = v24 == #p20.state.bubbles
		local v27
		if v26 then
			v27 = p20.props.renderFirstInsert or nil
		else
			v27 = nil
		end
		local v28 = p20.props.insertSize
		v21["Bubble" .. v25.messageId] = v_u_3.createElement(v_u_6, {
			["messageId"] = v25.messageId,
			["isMostRecent"] = v26,
			["theme"] = p20.props.theme,
			["fadingOut"] = v25.fadingOut,
			["onFadeOut"] = p20.onBubbleFadeOut,
			["chatSettings"] = v22,
			["renderInsert"] = v27,
			["insertSize"] = v28,
			["showCarat"] = p20.props.showCarat
		})
	end
	return v_u_3.createElement("Frame", {
		["Visible"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Visible"] = p20.props.isVisible,
		["Size"] = UDim2.fromScale(1, 1)
	}, v21)
end
return v4.connect(function(p29, p30) -- name: mapStateToProps
	return {
		["messageIds"] = p29.userMessages[p30.userId] or {}
	}
end)(v8)