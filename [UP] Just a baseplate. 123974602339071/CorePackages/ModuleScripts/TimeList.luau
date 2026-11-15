-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.DateTimePicker.Time.TimeList
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(script.Parent.Parent.Utilities.DateTimeCalendarViewUtilities)
local v_u_5 = require(script.Parent.Parent.Utilities.DateTimeLayoutUtilities)
local v_u_6 = require(script.Parent.Parent.DateTimeUtilities)
local v_u_7 = require(v1.Components.ScrollView)
local v_u_8 = require(v1.Enums.StateLayerMode)
local v_u_9 = require(v1.Components.Text)
local v_u_10 = require(v1.Providers.Style.useTokens)
local v_u_11 = require(v1.Utility.withDefaults)
local v_u_12 = {
	["testId"] = "--foundation-time-list"
}
return function(p13) -- name: TimeList
	-- upvalues: (copy) v_u_11, (copy) v_u_12, (copy) v_u_10, (copy) v_u_5, (copy) v_u_3, (copy) v_u_4, (copy) v_u_6, (copy) v_u_9, (copy) v_u_8, (copy) v_u_7
	local v_u_14 = v_u_11(p13, v_u_12)
	local v15 = v_u_10()
	local v_u_16 = v15.Size.Size_900
	local v17 = v_u_14.width or UDim.new(0, v_u_5.TIME_LIST_WIDTH)
	local v_u_18 = v_u_3.useRef(nil)
	local v_u_19 = v_u_3.useRef(false)
	local v_u_20 = v_u_3.useRef(true)
	local v_u_21 = v_u_3.useRef(nil)
	local v_u_23, v_u_24 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_14, (ref) v_u_4
		local v22 = v_u_14.dateTime or (v_u_14.dayAnchor or DateTime.now())
		return v_u_4.getTimeSlotsForDay(v22)
	end, { v_u_14.dateTime, v_u_14.dayAnchor })
	if not v_u_14.dateTime then
		v_u_24 = nil
	end
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_24, (ref) v_u_6, (copy) v_u_19, (copy) v_u_21, (copy) v_u_20, (copy) v_u_18, (ref) v_u_4, (copy) v_u_23, (copy) v_u_16, (copy) v_u_14
		local v25 = v_u_24
		local v26
		if v25 == nil then
			v26 = nil
		else
			local v27 = v_u_6.toLocalTime(DateTime.fromUnixTimestamp(v25))
			v26 = string.format("%02d:%02d", v27.Hour, v27.Minute)
		end
		if v_u_19.current then
			v_u_19.current = false
			v_u_21.current = v26
			v_u_20.current = false
			return
		else
			local v28 = v_u_18.current
			if v28 then
				local v29 = v_u_20.current
				v_u_20.current = false
				if v26 == nil then
					v_u_21.current = nil
					return
				elseif v26 == v_u_21.current then
					return
				elseif v29 or v_u_21.current ~= nil then
					v_u_21.current = v26
					local v30 = v_u_4.getTimeSlotIndex(v_u_23, v_u_24)
					if v30 then
						local v31 = (v30 - 1) * v_u_16 - v_u_14.height / 2 + v_u_16 / 2
						v28.CanvasPosition = Vector2.new(0, (math.max(0, v31)))
					end
				else
					v_u_21.current = v26
					return
				end
			else
				return
			end
		end
	end, {
		v_u_24,
		v_u_23,
		v_u_16,
		v_u_14.height
	})
	local v32 = {}
	for v33, v_u_34 in v_u_23 do
		local v35 = v_u_34.id == v_u_24
		local v36 = ("slot-%*"):format(v_u_34.id)
		local v37 = v_u_3.createElement
		local v38 = v_u_9
		local v39 = {
			["LayoutOrder"] = nil,
			["Size"] = nil,
			["Text"] = nil,
			["textStyle"] = nil,
			["backgroundStyle"] = nil,
			["stateLayer"] = nil,
			["onActivated"] = nil,
			["tag"] = "size-full-0 auto-y padding-x-medium text-body-medium text-align-x-left text-align-y-center radius-medium",
			["testId"] = nil,
			["LayoutOrder"] = v33,
			["Size"] = UDim2.new(1, 0, 0, v_u_16),
			["Text"] = v_u_34.text
		}
		local v40
		if v35 then
			v40 = v15.Inverse.Content.Emphasis
		else
			v40 = nil
		end
		v39.textStyle = v40
		local v41
		if v35 then
			v41 = v15.Color.System.Contrast
		else
			v41 = nil
		end
		v39.backgroundStyle = v41
		local v42 = {}
		local v43
		if v35 then
			v43 = v_u_8.Inverse
		else
			v43 = v_u_8.Default
		end
		v42.mode = v43
		v39.stateLayer = v42
		function v39.onActivated() -- name: onActivated
			-- upvalues: (copy) v_u_19, (copy) v_u_14, (copy) v_u_34
			v_u_19.current = true
			v_u_14.onItemChanged(v_u_34.id)
		end
		v39.testId = ("%*--slot-%*"):format(v_u_14.testId, v33)
		v32[v36] = v37(v38, v39)
	end
	return v_u_3.createElement(v_u_7, {
		["LayoutOrder"] = v_u_14.LayoutOrder,
		["Size"] = UDim2.new(v17.Scale, v17.Offset, 0, v_u_14.height),
		["layout"] = {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		},
		["scroll"] = {
			["AutomaticCanvasSize"] = Enum.AutomaticSize.Y,
			["CanvasSize"] = UDim2.fromOffset(0, 0),
			["ScrollingDirection"] = Enum.ScrollingDirection.Y
		},
		["scrollingFrameRef"] = v_u_18,
		["testId"] = v_u_14.testId
	}, v32)
end