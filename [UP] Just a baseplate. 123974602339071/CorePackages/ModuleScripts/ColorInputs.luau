-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.ColorPicker.ColorInputs
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v2.React)
require(v1.Components.Types)
local v_u_5 = require(v1.Components.Dropdown)
local v_u_6 = require(v1.Components.NumberInput)
local v_u_7 = require(v1.Components.TextInput)
local v_u_8 = require(v1.Components.View)
local v_u_9 = require(v1.Enums.ColorInputMode)
local v_u_10 = require(v1.Enums.InputSize)
local v_u_11 = require(v1.Enums.NumberInputControlsVariant)
local v_u_12 = require(v1.Components.ColorPicker.colorInputUtils)
local v_u_13 = require(v1.Components.ColorPicker.colorUtils)
local v_u_14 = require(v1.Utility.withCommonProps)
local v_u_15 = require(v1.Utility.withDefaults)
require(v1.Providers.Style.Tokens)
local v_u_16 = require(v1.Providers.Style.useTokens)
local function v_u_23(p_u_17, p18, p19) -- name: createNumberInputElement
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_3
	local v20 = p_u_17.value:getValue()
	if v20 == nil then
		return v_u_4.createElement(v_u_6, v_u_3.join({
			["value"] = -1,
			["onChanged"] = nil,
			["controlsVariant"] = nil,
			["minimum"] = nil,
			["maximum"] = nil,
			["step"] = nil,
			["precision"] = nil,
			["formatAsString"] = nil,
			["onChanged"] = function(p21) -- name: onChanged
				-- upvalues: (copy) p_u_17
				if p21 ~= -1 then
					p_u_17.handler(p21, p_u_17.component)
				end
			end,
			["controlsVariant"] = p18,
			["minimum"] = p_u_17.minimum or 0,
			["maximum"] = p_u_17.maximum or 255,
			["step"] = p_u_17.step or 1,
			["precision"] = p_u_17.precision or 0,
			["formatAsString"] = function(_) -- name: formatAsString
				return ""
			end
		}, p19))
	else
		return v_u_4.createElement(v_u_6, v_u_3.join({
			["value"] = v20,
			["onChanged"] = function(p22) -- name: onChanged
				-- upvalues: (copy) p_u_17
				p_u_17.handler(p22, p_u_17.component)
			end,
			["controlsVariant"] = p18,
			["minimum"] = p_u_17.minimum or 0,
			["maximum"] = p_u_17.maximum or 255,
			["step"] = p_u_17.step or 1,
			["precision"] = p_u_17.precision or 0
		}, p19))
	end
end
local function v_u_31(_, p_u_24, p25, p26, p27) -- name: renderInput
	-- upvalues: (copy) v_u_10, (copy) v_u_9, (copy) v_u_4, (copy) v_u_8, (copy) v_u_7, (copy) v_u_23, (copy) v_u_11
	local v28 = p26 == p_u_24.key:lower() and "" or ("-%*"):format((p_u_24.key:lower()))
	local v29 = {
		["size"] = nil,
		["label"] = "",
		["width"] = nil,
		["LayoutOrder"] = nil,
		["testId"] = nil,
		["size"] = v_u_10.XSmall,
		["width"] = UDim.new(1, 0),
		["LayoutOrder"] = p25,
		["testId"] = ("%*-%*%*"):format(p27, p26, v28)
	}
	if p_u_24.key == v_u_9.Hex then
		return v_u_4.createElement(v_u_8, {
			["tag"] = "grow-1 size-0-full",
			["LayoutOrder"] = nil,
			["LayoutOrder"] = p25
		}, {
			["Input"] = v_u_4.createElement(v_u_7, {
				["text"] = nil,
				["onChanged"] = nil,
				["placeholder"] = nil,
				["size"] = nil,
				["label"] = "",
				["width"] = nil,
				["testId"] = nil,
				["text"] = p_u_24.value:getValue(),
				["onChanged"] = function(p30) -- name: onChanged
					-- upvalues: (copy) p_u_24
					p_u_24.handler(p30, p_u_24.component)
				end,
				["placeholder"] = p_u_24.placeholder or "#000000",
				["size"] = v_u_10.XSmall,
				["width"] = UDim.new(1, 0),
				["testId"] = ("%*-%*"):format(p27, p26)
			})
		})
	else
		return v_u_4.createElement(v_u_8, {
			["tag"] = "grow-1 size-0-full",
			["LayoutOrder"] = nil,
			["LayoutOrder"] = p25
		}, {
			["Input"] = v_u_23(p_u_24, v_u_11.None, v29)
		})
	end
end
local v_u_32 = {
	["alpha"] = v_u_4.createBinding(1)
}
return function(p33) -- name: ColorInputs
	-- upvalues: (copy) v_u_9, (copy) v_u_15, (copy) v_u_32, (copy) v_u_16, (copy) v_u_4, (copy) v_u_13, (copy) v_u_8, (copy) v_u_7, (copy) v_u_10, (copy) v_u_12, (copy) v_u_31, (copy) v_u_14, (copy) v_u_3, (copy) v_u_5
	local v_u_34 = p33.availableModes or {
		v_u_9.RGB,
		v_u_9.HSV,
		v_u_9.Hex,
		v_u_9.Brick
	}
	local v_u_35 = v_u_15(p33, v_u_32)
	local v_u_36 = v_u_16()
	local v_u_37 = v_u_35.mode or v_u_9.RGB
	local v_u_38 = v_u_35.color
	local v_u_39 = v_u_35.alpha
	local v_u_41 = v_u_4.useCallback(function(p40)
		-- upvalues: (copy) v_u_35
		if v_u_35.onColorChanged then
			v_u_35.onColorChanged(p40)
		end
	end, { v_u_35.onColorChanged })
	local v_u_42 = v_u_35.onAlphaChanged
	local v_u_43 = v_u_35.onAlphaChanged ~= nil
	local v_u_50 = v_u_38:map(function(p44)
		-- upvalues: (ref) v_u_13
		if v_u_13.isPartialHSV(p44) then
			return {
				["r"] = nil,
				["g"] = nil,
				["b"] = nil
			}
		end
		local v45 = v_u_13.toColor3(p44)
		local v46 = {}
		local v47 = v45.R * 255
		v46.r = math.round(v47)
		local v48 = v45.G * 255
		v46.g = math.round(v48)
		local v49 = v45.B * 255
		v46.b = math.round(v49)
		return v46
	end)
	local v_u_59 = v_u_38:map(function(p51)
		if type(p51) == "table" then
			return {
				["h"] = p51.H,
				["s"] = p51.S,
				["v"] = p51.V
			}
		end
		local v52, v53, v54 = p51:ToHSV()
		local v55 = {}
		local v56 = v52 * 360
		v55.h = math.round(v56)
		local v57 = v53 * 100
		v55.s = math.round(v57)
		local v58 = v54 * 100
		v55.v = math.round(v58)
		return v55
	end)
	local v_u_61 = v_u_50:map(function(p60)
		return (p60.r == nil or (p60.g == nil or p60.b == nil)) and "" or string.format("#%02X%02X%02X", p60.r, p60.g, p60.b)
	end)
	local v_u_66 = v_u_4.useCallback(function(p62, p63)
		-- upvalues: (copy) v_u_50, (copy) v_u_41
		local v64 = math.clamp(p62, 0, 255)
		local v65 = table.clone(v_u_50:getValue())
		v65[p63] = v64
		if v65.r ~= nil and (v65.g ~= nil and v65.b ~= nil) then
			v_u_41((Color3.fromRGB(v65.r, v65.g, v65.b)))
		end
	end, { v_u_50, v_u_41 })
	local v_u_68 = v_u_4.useCallback(function(p67)
		-- upvalues: (copy) v_u_42
		if v_u_42 then
			v_u_42(p67)
		end
	end, { v_u_42 })
	local v_u_73 = v_u_4.useCallback(function(p69, p70)
		-- upvalues: (copy) v_u_59, (copy) v_u_41
		local v71 = table.clone(v_u_59:getValue())
		if v71[p70] ~= nil or p69 ~= 0 then
			local v72 = p70 == "h" and 360 or 100
			v71[p70] = math.clamp(p69, 0, v72)
			v_u_41((Color3.fromHSV(v71.h / 360, (v71.s or 100) / 100, (v71.v or 100) / 100)))
		end
	end, { v_u_59, v_u_41 })
	local v_u_82 = v_u_4.useCallback(function(p74)
		-- upvalues: (copy) v_u_41
		local v75 = p74:gsub("#", ""):upper()
		if v75:match("^%x%x%x%x%x%x$") then
			local v76 = v75:sub(1, 2)
			local v77 = tonumber(v76, 16)
			local v78 = v75:sub(3, 4)
			local v79 = tonumber(v78, 16)
			local v80 = v75:sub(5, 6)
			local v81 = tonumber(v80, 16)
			if v77 and (v79 and v81) then
				v_u_41((Color3.fromRGB(v77, v79, v81)))
			end
		end
	end, { v_u_41 })
	local v91 = v_u_4.useMemo(function()
		-- upvalues: (ref) v_u_9, (copy) v_u_43, (copy) v_u_34
		local v83 = {
			{
				["id"] = v_u_9.RGB,
				["text"] = v_u_9.RGB
			},
			{
				["id"] = v_u_9.HSV,
				["text"] = v_u_9.HSV
			},
			{
				["id"] = v_u_9.Hex,
				["text"] = v_u_9.Hex
			},
			{
				["id"] = v_u_9.Brick,
				["text"] = v_u_9.Brick
			}
		}
		if v_u_43 then
			local v84 = {
				["id"] = v_u_9.RGBA,
				["text"] = v_u_9.RGBA
			}
			table.insert(v83, 2, v84)
		end
		local v85 = v_u_34
		if not v85 then
			return v83
		end
		local v86 = {}
		for _, v87 in v83 do
			local v88 = v87.id
			for _, v89 in v85 do
				local v90
				if v88 == v89 then
					v90 = true
				elseif v88 == v_u_9.RGBA and v89 == v_u_9.RGB then
					v90 = v_u_43
				else
					v90 = false
				end
				if not v90 then
					continue
				end
				table.insert(v86, v87)
			end
		end
		return v86
	end, { v_u_43 })
	v_u_4.useEffect(function()
		-- upvalues: (copy) v_u_37, (ref) v_u_9, (copy) v_u_43, (copy) v_u_35
		if v_u_37 == v_u_9.RGBA and (not v_u_43 and v_u_35.onModeChanged) then
			v_u_35.onModeChanged(v_u_9.RGB)
		end
	end, { v_u_37, v_u_43 })
	local function v100()
		-- upvalues: (copy) v_u_37, (ref) v_u_9, (ref) v_u_4, (ref) v_u_8, (ref) v_u_7, (copy) v_u_38, (ref) v_u_10, (copy) v_u_35, (ref) v_u_12, (copy) v_u_50, (copy) v_u_59, (copy) v_u_61, (copy) v_u_39, (copy) v_u_66, (copy) v_u_73, (copy) v_u_82, (copy) v_u_68, (copy) v_u_36, (ref) v_u_31
		if v_u_37 ~= v_u_9.Brick then
			local v92 = v_u_12.createInputConfigs(v_u_50, v_u_59, v_u_61, v_u_39, v_u_66, v_u_73, v_u_82, v_u_68, v_u_36)[v_u_37]
			if not v92 then
				return nil
			end
			local v93 = {}
			for v94, v95 in ipairs(v92) do
				v93[v95.key .. "Input"] = v_u_31(v_u_36, v95, v94, v_u_37:lower(), v_u_35.testId)
			end
			return v93
		end
		local v96 = {}
		local v97 = v_u_4.createElement
		local v98 = v_u_8
		local v99 = {
			["Input"] = v_u_4.createElement(v_u_7, {
				["text"] = nil,
				["onChanged"] = nil,
				["isDisabled"] = true,
				["size"] = nil,
				["label"] = "",
				["width"] = nil,
				["testId"] = nil,
				["text"] = BrickColor.new(v_u_38:getValue()).Name,
				["onChanged"] = function() -- name: onChanged end,
				["size"] = v_u_10.XSmall,
				["width"] = UDim.new(1, 0),
				["testId"] = ("%*-brick-name"):format(v_u_35.testId)
			})
		}
		v96.BrickColorName = v97(v98, {
			["tag"] = "grow-1 size-0-full",
			["LayoutOrder"] = 1
		}, v99)
		return v96
	end
	local v101 = v_u_4.createElement
	local v102 = v_u_8
	local v103 = v_u_14(v_u_35, {
		["tag"] = "row gap-xsmall size-full-600"
	})
	local v104 = v_u_3.join
	local v105 = {}
	local v106
	if #v91 > 1 then
		v106 = v_u_4.createElement(v_u_5.Root, {
			["items"] = nil,
			["value"] = nil,
			["onItemChanged"] = nil,
			["size"] = nil,
			["label"] = "",
			["width"] = nil,
			["testId"] = nil,
			["items"] = v91,
			["value"] = v_u_37,
			["onItemChanged"] = function(p107) -- name: onItemChanged
				-- upvalues: (copy) v_u_35
				if v_u_35.onModeChanged then
					v_u_35.onModeChanged(p107)
				end
			end,
			["size"] = v_u_10.XSmall,
			["width"] = UDim.new(0, v_u_36.Size.Size_1600),
			["testId"] = ("%*--mode-dropdown"):format(v_u_35.testId)
		})
	else
		v106 = nil
	end
	v105.ModeDropdown = v106
	return v101(v102, v103, v104(v105, (v100())))
end