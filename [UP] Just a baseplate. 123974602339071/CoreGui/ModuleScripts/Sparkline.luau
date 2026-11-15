-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.Sparkline
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(script.Parent.Parent.Constants)
local v_u_4 = v3.GeneralFormatting.LineWidth
local v_u_5 = v3.Color.HighlightBlue
local v_u_6 = UDim2.fromOffset(52, 13)
local v7 = v_u_2.Component:extend("Sparkline")
function v7.init(p8) -- name: init
	-- upvalues: (copy) v_u_2
	p8.graphRef = v_u_2.createRef()
	p8.state = {
		["absSize"] = nil
	}
end
function v7.didMount(p9) -- name: didMount
	p9:setState({
		["absSize"] = p9.graphRef.current.AbsoluteSize
	})
end
function v7.didUpdate(p10) -- name: didUpdate
	local v11 = p10.graphRef.current.AbsoluteSize
	if p10.state.absSize ~= v11 then
		p10:setState({
			["absSize"] = v11
		})
	end
end
function v7.render(p12) -- name: render
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_4, (copy) v_u_6
	local v13 = p12.props.dataSet
	local v14 = p12.props.getY
	local v15 = p12.props.minY
	local v16 = p12.props.maxY
	local v17 = p12.props.color or v_u_5
	local v18 = p12.state.absSize
	local v19 = {}
	if v18 and v13 then
		local v20 = v13:iterator()
		local v21 = v20:next()
		local v22 = {}
		while v21 do
			table.insert(v22, v14(v21))
			v21 = v20:next()
		end
		local v23 = v16 - v15
		local v24 = #v22
		for v25 = 2, v24 do
			local v26 = v23 > 0 and ((v22[v25] - v15) / v23 or 0.5) or 0.5
			local v27 = v23 > 0 and ((v22[v25 - 1] - v15) / v23 or 0.5) or 0.5
			local v28 = (v25 - 1) / (v24 - 1) * v18.X
			local v29 = (v25 - 2) / (v24 - 1) * v18.X
			local v30 = v26 * v18.Y
			local v31 = v27 * v18.Y
			local v32 = (v28 + v29) / 2
			local v33 = (v30 + v31) / 2
			local v34 = v28 - v29
			local v35 = v30 - v31
			local v36 = v34 * v34 + v35 * v35
			local v37 = math.sqrt(v36)
			local v38 = math.atan2(v35, v34)
			local v39 = math.deg(v38)
			v19["seg" .. v25] = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["Position"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Rotation"] = nil,
				["Size"] = UDim2.new(0, v37, 0, v_u_4),
				["Position"] = UDim2.new(0, v32 - v37 / 2, 1, -v33),
				["BackgroundColor3"] = v17,
				["Rotation"] = -v39
			})
		end
	end
	return v_u_2.createElement("Frame", {
		["Size"] = p12.props.size or v_u_6,
		["Position"] = p12.props.pos,
		["LayoutOrder"] = p12.props.layoutOrder,
		["BackgroundTransparency"] = 1,
		[v_u_2.Ref] = p12.graphRef
	}, v19)
end
return v7