-- Path: CoreGui.RobloxGui.Modules.Feedback.Components.FeedbackBarHint
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.UIBlox)
local v3 = require(v1.Packages.t)
local v_u_4 = require(v1.Packages.Roact)
local v_u_5 = v2.Core.Style.withStyle
local v_u_6 = v2.App.Text.StyledTextLabel
local v_u_7 = game:DefineFastFlag("FeedbackBarHintSizeAdjustment", false)
local v8 = v_u_4.PureComponent:extend("FeedbackBarHint")
v8.validateProps = v3.strictInterface({
	["layoutOrder"] = v3.optional(v3.integer),
	["text"] = v3.string,
	["maxWidth"] = v3.optional(v3.number),
	["hintTextSize"] = v3.optional(v3.number)
})
function v8.render(p_u_9) -- name: render
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_6, (copy) v_u_7
	return v_u_5(function(p10)
		-- upvalues: (ref) v_u_4, (copy) p_u_9, (ref) v_u_6, (ref) v_u_7
		local v11 = p10.Theme
		local v12 = p10.Font
		local v13 = v_u_4.createElement
		local v14 = "Frame"
		local v15 = {
			["LayoutOrder"] = nil,
			["BackgroundTransparency"] = 1,
			["AutomaticSize"] = nil,
			["LayoutOrder"] = p_u_9.props.layoutOrder,
			["AutomaticSize"] = Enum.AutomaticSize.X
		}
		local v16 = {
			["Layout"] = v_u_4.createElement("UIListLayout", {
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center,
				["Padding"] = UDim.new(0, 8)
			})
		}
		local v17 = v_u_4.createElement
		local v18 = v_u_6
		local v19 = {
			["textSize"] = nil,
			["maxSize"] = nil,
			["layoutOrder"] = 2,
			["fontStyle"] = nil,
			["colorStyle"] = nil,
			["automaticSize"] = nil,
			["fluidSizing"] = nil,
			["text"] = nil,
			["textTruncate"] = nil,
			["textXAlignment"] = nil,
			["textYAlignment"] = nil,
			["textSize"] = p_u_9.props.hintTextSize
		}
		local v20
		if p_u_9.props.maxWidth then
			if v_u_7 then
				v20 = Vector2.new(1000, p_u_9.props.maxWidth)
			else
				v20 = Vector2.new(p_u_9.props.maxWidth)
			end
		else
			v20 = nil
		end
		v19.maxSize = v20
		v19.fontStyle = v12.Header2
		v19.colorStyle = v11.TextEmphasis
		local v21
		if p_u_9.props.maxWidth then
			v21 = nil
		else
			v21 = Enum.AutomaticSize.X
		end
		v19.automaticSize = v21
		v19.fluidSizing = p_u_9.props.maxWidth and true or false
		v19.text = p_u_9.props.text
		local v22
		if p_u_9.props.maxWidth then
			v22 = Enum.TextTruncate.AtEnd
		else
			v22 = nil
		end
		v19.textTruncate = v22
		v19.textXAlignment = Enum.TextXAlignment.Left
		v19.textYAlignment = Enum.TextYAlignment.Center
		v16.FeedbackBarHintText = v17(v18, v19)
		return v13(v14, v15, v16)
	end)
end
return v8