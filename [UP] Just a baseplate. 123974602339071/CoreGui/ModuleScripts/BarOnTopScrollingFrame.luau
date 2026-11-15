-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.BarOnTopScrollingFrame
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.t
local v5 = v_u_3.PureComponent:extend("BarOnTopScrollingFrame")
v5.validateProps = v4.strictInterface({
	["Size"] = v4.UDim2,
	["Position"] = v4.optional(v4.UDim2),
	["CanvasSize"] = v4.UDim2,
	["ScrollingEnabled"] = v4.optional(v4.boolean),
	[v_u_3.Children] = v4.table,
	["onCanvasPositionChanged"] = v4.optional(v4.callback),
	["scrollingFrameRef"] = v4.optional(v4.table)
})
v5.defaultProps = {
	["ScrollingEnabled"] = true
}
function v5.init(p6) -- name: init
	p6.state = {
		["CanvasPosition"] = Vector2.new(0, 0)
	}
end
function v5.render(p_u_7) -- name: render
	-- upvalues: (copy) v_u_3
	local v8 = v_u_3.createElement
	local v9 = {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 1,
		["ClipsDescendants"] = true,
		["Size"] = p_u_7.props.Size,
		["Position"] = p_u_7.props.Position
	}
	local v12 = {
		["DisplayScrollingFrame"] = v_u_3.createElement("ScrollingFrame", {
			["CanvasPosition"] = p_u_7.state.CanvasPosition,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(0, 8, 1, 0),
			["CanvasSize"] = p_u_7.props.CanvasSize - UDim2.new(0, 8, 0, 0),
			["ScrollBarThickness"] = 8,
			["BorderSizePixel"] = 0,
			["ZIndex"] = 2,
			["Position"] = UDim2.new(1, -8, 0, 0),
			["ScrollingEnabled"] = p_u_7.props.ScrollingEnabled,
			["ScrollingDirection"] = Enum.ScrollingDirection.Y,
			["Selectable"] = false,
			[v_u_3.Ref] = p_u_7.props.scrollingFrameRef,
			[v_u_3.Change.CanvasPosition] = function(p10)
				-- upvalues: (copy) p_u_7
				p_u_7:setState({
					["CanvasPosition"] = p10.CanvasPosition
				})
				if p_u_7.props.onCanvasPositionChanged then
					p_u_7.props.onCanvasPositionChanged(p10)
				end
			end
		}),
		["ContentsScrollingFrame"] = v_u_3.createElement("ScrollingFrame", {
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, -8, 1, 0),
			["CanvasSize"] = p_u_7.props.CanvasSize - UDim2.new(0, 8, 0, 0),
			["CanvasPosition"] = p_u_7.state.CanvasPosition,
			["ScrollBarThickness"] = 0,
			["BorderSizePixel"] = 0,
			["ClipsDescendants"] = false,
			["ScrollingEnabled"] = p_u_7.props.ScrollingEnabled,
			["ScrollingDirection"] = Enum.ScrollingDirection.Y,
			["Selectable"] = false,
			[v_u_3.Change.CanvasPosition] = function(p11)
				-- upvalues: (copy) p_u_7
				p_u_7:setState({
					["CanvasPosition"] = p11.CanvasPosition
				})
			end
		}, { v_u_3.createElement("Frame", {
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["Size"] = UDim2.new(1, 8, 1, 0)
			}, p_u_7.props[v_u_3.Children]) })
	}
	return v8("Frame", v9, v12)
end
return v5