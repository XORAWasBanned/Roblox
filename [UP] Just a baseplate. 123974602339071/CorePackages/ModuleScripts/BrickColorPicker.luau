-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.ColorPicker.BrickColorPicker
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.Image)
local v_u_5 = require(v1.Enums.StateLayerAffordance)
require(v1.Components.Types)
local v_u_6 = require(v1.Components.View)
local v_u_7 = require(v1.Components.ColorPicker.BrickColorConstants)
local v_u_8 = require(v1.Providers.Style.useTokens)
local v_u_9 = require(v1.Utility.withCommonProps)
local v10 = require(v1.Utility.Wrappers)
local v_u_11 = v10.Connection
local v_u_12 = v10.Signal
local function v_u_19(p13) -- name: calculateGridRadius
	for v14 = 3, 20, 2 do
		local v15 = v14 * v14
		local v16 = v14 / 2
		local v17 = math.floor(v16)
		local v18 = v14 / 2
		if p13 >= v15 - v17 * (math.floor(v18) + 1) then
			continue
		end
		return v14 - 2
	end
	return 7
end
local function v_u_46(p20) -- name: BottomRowSwatches
	-- upvalues: (copy) v_u_3, (copy) v_u_12, (copy) v_u_11, (copy) v_u_4, (copy) v_u_6
	local v_u_21, v_u_22 = v_u_3.useState(0)
	local v_u_23 = v_u_3.useRef(nil)
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_23, (copy) v_u_21, (copy) v_u_22, (ref) v_u_12, (ref) v_u_11
		local v_u_24 = v_u_23.current
		if v_u_24 then
			local v25 = v_u_24.AbsoluteSize.X
			local v26 = math.round(v25)
			if v26 ~= v_u_21 then
				v_u_22(v26)
			end
			local v_u_29 = v_u_12.Connect(v_u_24:GetPropertyChangedSignal("AbsoluteSize"), function()
				-- upvalues: (ref) v_u_22, (copy) v_u_24
				local v27 = v_u_22
				local v28 = v_u_24.AbsoluteSize.X
				v27((math.round(v28)))
			end)
			return function()
				-- upvalues: (ref) v_u_11, (copy) v_u_29
				v_u_11.Disconnect(v_u_29)
			end
		end
	end, { v_u_21 })
	local v30 = {}
	if v_u_21 > 0 then
		local v31 = #p20.colors
		local v32 = v_u_21 - p20.paddingHorizontal * 2
		local v33 = v32 / v31
		local v34 = math.floor(v33)
		local v35 = v34 * (v31 - 1)
		local v36 = p20.paddingHorizontal
		local v37 = (v32 - v35) / 2
		local v38 = v36 + math.floor(v37)
		for v39, v40 in ipairs(p20.colors) do
			local v41 = v38 + v34 * (v39 - 1)
			local v42 = ("Swatch_%*"):format(v39)
			local v43 = v_u_3.createElement
			local v44 = v_u_4
			local v45 = {
				["Size"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["Image"] = "component_assets/hexagon_24",
				["imageStyle"] = nil,
				["Size"] = UDim2.fromOffset(p20.swatchWidth, p20.swatchHeight),
				["Position"] = UDim2.fromOffset(v41, p20.swatchCenterY),
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["imageStyle"] = {
					["Color3"] = v40.Color
				}
			}
			v30[v42] = v43(v44, v45)
		end
	end
	return v_u_3.createElement(v_u_6, {
		["tag"] = "size-full",
		["ref"] = nil,
		["ref"] = v_u_23
	}, v30)
end
return function(p_u_47) -- name: BrickColorPicker
	-- upvalues: (copy) v_u_8, (copy) v_u_3, (copy) v_u_7, (copy) v_u_19, (copy) v_u_4, (copy) v_u_6, (copy) v_u_9, (copy) v_u_5, (copy) v_u_46
	local v_u_48 = v_u_8()
	local v_u_49 = v_u_48.Size.Size_200
	local v_u_50 = v_u_48.Size.Size_350
	local v_u_51 = v_u_48.Size.Size_400
	local v_u_52 = v_u_48.Size.Size_100
	local v53 = v_u_48.Size.Size_350
	local v54 = v_u_48.Size.Size_400
	local v_u_55 = v_u_48.Size.Size_200
	local v_u_56 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_7
		return v_u_7.MAIN
	end, {})
	local v_u_57 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_7
		return v_u_7.BOTTOM
	end, {})
	local v_u_59 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_19, (copy) v_u_56
		local v58 = v_u_19(#v_u_56)
		if v58 >= 3 then
			return v58
		end
		warn("BrickColorPicker: Calculated grid radius is too small, falling back to minimum")
		return 3
	end, {})
	local v_u_87, v_u_88 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_59, (copy) v_u_49, (copy) v_u_56, (copy) v_u_50, (copy) v_u_51
		local v60 = v_u_59
		local v61 = v_u_49 + 1
		local v62 = v_u_49
		local v63 = v61 * 1.5
		local v64 = math.round(v63)
		local v65 = 1
		local v66 = {}
		for v67 = 0, v60 - 1 do
			for v68 = 0, 2 * v60 - 1 - 1 do
				local v69 = v60 / 2
				local v70 = math.floor(v69) - v67
				local v71 = math.abs(v70)
				local v72 = (2 * v60 - 1) / 2
				local v73 = math.floor(v72) - v68
				if v71 + math.abs(v73) >= v60 or (v67 % 2 ~= v68 % 2 or v65 > #v_u_56) then
					continue
				end
				local v74 = v62 * v68
				local v75
				if v64 then
					v75 = v64 * v67
				else
					local v76 = v61 * 1.5 * v67
					v75 = math.round(v76)
				end
				local v77 = {
					["brickColor"] = v_u_56[v65],
					["x"] = v74,
					["y"] = v75
				}
				table.insert(v66, v77)
				v65 = v65 + 1
			end
		end
		local v78 = (1 / 0)
		local v79 = (-1 / 0)
		local v80 = (1 / 0)
		local v81 = (-1 / 0)
		for _, v82 in v66 do
			local v83 = v82.x - v_u_50 / 2
			v78 = math.min(v78, v83)
			local v84 = v82.x + v_u_50 / 2
			v79 = math.max(v79, v84)
			local v85 = v82.y - v_u_51 / 2
			v80 = math.min(v80, v85)
			local v86 = v82.y + v_u_51 / 2
			v81 = math.max(v81, v86)
		end
		return v66, {
			["width"] = v79 - v78,
			["height"] = v81 - v80,
			["offset"] = Vector2.new(v78, v80)
		}
	end, {
		v_u_59,
		v_u_49,
		v_u_56,
		v_u_57,
		v_u_48.Size.Size_100,
		v_u_48.Size.Size_50
	})
	local v99 = v_u_3.useCallback(function(p89, p90)
		-- upvalues: (copy) v_u_88, (copy) v_u_87, (copy) v_u_49, (copy) p_u_47
		if p90.UserInputType == Enum.UserInputType.MouseButton1 then
			local v91 = p90.Position.X - p89.AbsolutePosition.X
			local v92 = p90.Position.Y - p89.AbsolutePosition.Y
			local v93 = v91 + v_u_88.offset.X
			local v94 = v92 + v_u_88.offset.Y
			local v95 = (1 / 0)
			local v96 = nil
			for _, v97 in v_u_87 do
				local v98 = (v93 - v97.x) ^ 2 + (v94 - v97.y) ^ 2
				if v98 >= v95 then
					continue
				end
				v96 = v97
				v95 = v98
			end
			if v96 and v95 < v_u_49 * v_u_49 then
				p_u_47.onBrickColorChanged(v96.brickColor)
				if p_u_47.onColorChanged then
					p_u_47.onColorChanged(v96.brickColor.Color)
				end
			end
		end
	end, {
		v_u_87,
		v_u_88,
		v_u_49,
		p_u_47.onBrickColorChanged,
		p_u_47.onColorChanged
	})
	local v109 = v_u_3.useCallback(function(p100, p101)
		-- upvalues: (copy) v_u_52, (copy) v_u_57, (copy) p_u_47
		if p101.UserInputType == Enum.UserInputType.MouseButton1 then
			local v102 = p101.Position.X - p100.AbsolutePosition.X
			local v103 = p100.AbsoluteSize.X - 2 * v_u_52
			local v104 = v102 - v_u_52
			if v104 >= 0 and v104 <= v103 then
				local v105 = v104 / v103 * #v_u_57
				local v106 = math.floor(v105) + 1
				local v107 = #v_u_57
				local v108 = v_u_57[math.clamp(v106, 1, v107)]
				p_u_47.onBrickColorChanged(v108)
				if p_u_47.onColorChanged then
					p_u_47.onColorChanged(v108.Color)
				end
			end
		end
	end, { v_u_57, p_u_47.onBrickColorChanged, p_u_47.onColorChanged })
	local v_u_117 = v_u_3.useCallback(function(p110, p111)
		-- upvalues: (copy) v_u_88, (ref) v_u_3, (ref) v_u_4, (copy) v_u_50, (copy) v_u_55, (copy) v_u_51, (copy) v_u_48
		local v112 = UDim2.fromOffset(p110.x - v_u_88.offset.X, p110.y - v_u_88.offset.Y)
		local v113 = {}
		if p111 then
			v113.outline = v_u_3.createElement(v_u_4, {
				["Size"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["Image"] = "component_assets/hexagon_24",
				["imageStyle"] = nil,
				["ZIndex"] = 1,
				["Size"] = UDim2.fromOffset(v_u_50 + v_u_55, v_u_51 + v_u_55),
				["Position"] = v112,
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["imageStyle"] = v_u_48.Color.System.Emphasis
			})
		end
		local v114 = v_u_3.createElement
		local v115 = v_u_4
		local v116 = {
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["Image"] = "component_assets/hexagon_24",
			["imageStyle"] = nil,
			["ZIndex"] = 2,
			["Size"] = UDim2.fromOffset(v_u_50, v_u_51),
			["Position"] = v112,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["imageStyle"] = {
				["Color3"] = p110.brickColor.Color
			}
		}
		v113.hexagon = v114(v115, v116)
		return v113
	end, {
		v_u_88.offset.X,
		v_u_88.offset.Y,
		v_u_50,
		v_u_51,
		v_u_48
	})
	local v125 = v_u_3.useCallback(function()
		-- upvalues: (copy) p_u_47, (copy) v_u_87, (copy) v_u_117
		local v118 = p_u_47.selectedColor and p_u_47.selectedColor:getValue() or nil
		local v119 = {}
		for v120, v121 in v_u_87 do
			local v122
			if v118 == nil then
				v122 = false
			else
				v122 = v118 == v121.brickColor.Color
			end
			for v123, v124 in v_u_117(v121, v122) do
				v119[("%*_%*"):format(v123, v120)] = v124
			end
		end
		return v119
	end, { p_u_47.selectedColor })
	local v126 = v_u_3.createElement
	local v127 = v_u_6
	local v128 = v_u_9(p_u_47, {
		["tag"] = "col align-x-center gap-small size-full-0 auto-y"
	})
	local v129 = {}
	local v130 = v_u_3.createElement
	local v131 = v_u_6
	local v132 = {
		["Size"] = nil,
		["LayoutOrder"] = 1,
		["onActivated"] = nil,
		["stateLayer"] = nil,
		["Size"] = UDim2.fromOffset(v_u_88.width, v_u_88.height),
		["onActivated"] = v99,
		["stateLayer"] = {
			["affordance"] = v_u_5.None
		}
	}
	v129.ColorGrid = v130(v131, v132, (v125()))
	local v133 = v_u_3.createElement
	local v134 = v_u_6
	local v135 = {
		["Size"] = nil,
		["tag"] = "stroke-standard stroke-muted radius-circle bg-surface-100",
		["LayoutOrder"] = 2,
		["onActivated"] = nil,
		["stateLayer"] = nil,
		["Size"] = UDim2.new(1, -v_u_48.Size.Size_400, 0, v_u_48.Size.Size_500),
		["onActivated"] = v109,
		["stateLayer"] = {
			["affordance"] = v_u_5.None
		}
	}
	local v136 = {
		["Swatches"] = v_u_3.createElement(v_u_46, {
			["colors"] = v_u_57,
			["paddingHorizontal"] = v_u_52,
			["swatchWidth"] = v53,
			["swatchHeight"] = v54,
			["swatchCenterY"] = v_u_48.Size.Size_250
		})
	}
	v129.BottomRow = v133(v134, v135, v136)
	return v126(v127, v128, v129)
end