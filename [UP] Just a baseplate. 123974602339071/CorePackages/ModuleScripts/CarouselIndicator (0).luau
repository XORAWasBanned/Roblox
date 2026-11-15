-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.CarouselIndicator.CarouselIndicator
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
require(v2.Otter)
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactOtter)
local v_u_5 = require(v2.ReactUtils).useRefCache
require(v1.Components.Types)
local v_u_6 = require(v1.Components.View)
local v_u_7 = require(v1.Providers.Style.useTokens)
local v_u_8 = require(v1.Utility.withCommonProps)
local v_u_9 = require(v1.Utility.withDefaults)
local v_u_10 = require(script.Parent.Dot)
local v_u_11 = require(script.Parent.getCarouselIndicatorDotsConfig)
local function v_u_20(p12, p13, p14) -- name: getDotCenter
	local v15 = #p12 - 1
	local v16 = math.max(v15, 0) * p14
	local v17 = 0
	for v18, v19 in p12 do
		v16 = v16 + v19.size
		if v18 < p13 then
			v17 = v17 + (v19.size + p14)
		else
			if v18 ~= p13 then
				continue
			end
			v17 = v17 + v19.size / 2
		end
	end
	return v17 - v16 / 2
end
local v_u_21 = {
	["page"] = 1,
	["count"] = 5,
	["testId"] = "--foundation-carousel-indicator"
}
return v_u_3.memo(v_u_3.forwardRef(function(p22, p23) -- name: CarouselIndicator
	-- upvalues: (copy) v_u_9, (copy) v_u_21, (copy) v_u_7, (copy) v_u_3, (copy) v_u_11, (copy) v_u_4, (copy) v_u_5, (copy) v_u_20, (copy) v_u_10, (copy) v_u_6, (copy) v_u_8
	local v_u_24 = v_u_9(p22, v_u_21)
	local v_u_25 = v_u_7()
	local v_u_26 = v_u_24.count
	local v_u_27 = v_u_25.Size.Size_100
	local v_u_28 = v_u_25.Size.Size_200
	local v_u_29 = v_u_25.Size.Size_100
	local v30 = math.min(5, v_u_26)
	local v31 = v30 * v_u_28 + (v30 - 1) * v_u_27
	local v_u_32 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_11, (copy) v_u_28, (copy) v_u_29, (copy) v_u_24, (copy) v_u_26
		return v_u_11(v_u_28, v_u_29, v_u_24.page, v_u_26)
	end, {
		v_u_28,
		v_u_29,
		v_u_24.page,
		v_u_26
	})
	local v_u_33 = v_u_3.useRef(nil)
	local v_u_34, v_u_35 = v_u_4.useAnimatedBinding(0)
	local v_u_36 = v_u_5()
	local v_u_37 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_25
		return {
			["easingStyle"] = v_u_25.Ease.StandardOut,
			["duration"] = v_u_25.Time.Time_200
		}
	end, { v_u_25 })
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_33, (copy) v_u_32, (ref) v_u_20, (copy) v_u_27, (copy) v_u_35, (ref) v_u_4, (copy) v_u_37, (copy) v_u_34
		local v38 = v_u_33.current
		v_u_33.current = v_u_32
		if v38 and (v38.count == v_u_32.count and v38.page ~= v_u_32.page) then
			local v39 = v_u_32.page - v38.page
			local v40 = v38.activeVisibleIndex + v39
			local v41 = #v38.dots
			local v42 = math.clamp(v40, 1, v41)
			local v43 = v_u_20(v38.dots, v42, v_u_27) - v_u_20(v_u_32.dots, v_u_32.activeVisibleIndex, v_u_27)
			v_u_35(v_u_4.ease(0, {
				["easingStyle"] = v_u_37.easingStyle,
				["duration"] = v_u_37.duration,
				["startingValue"] = v_u_34:getValue() + v43
			}))
		else
			v_u_35((v_u_4.instant(0)))
		end
	end, { v_u_32, v_u_27, v_u_37 })
	local v44 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_25
		return {
			["easingStyle"] = v_u_25.Ease.Linear,
			["duration"] = v_u_25.Time.Time_100
		}
	end, { v_u_25 })
	local v45 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_25
		return {
			["easingStyle"] = v_u_25.Ease.StandardOut,
			["duration"] = v_u_25.Time.Time_300
		}
	end, { v_u_25 })
	v_u_3.useImperativeHandle(p23, function()
		-- upvalues: (copy) v_u_24, (copy) v_u_32, (copy) v_u_36
		if v_u_24.onActivated then
			local v46 = nil
			for _, v47 in v_u_32.dots do
				if v47.isActive then
					continue
				end
				v46 = v47.page
			end
			if v46 then
				return v_u_36[v46].current
			else
				return nil
			end
		else
			return nil
		end
	end, { v_u_36, v_u_32.dots, v_u_24.onActivated })
	local v48 = {}
	for v49, v50 in v_u_32.dots do
		local v51 = v_u_32.dots[v49 - 1]
		local v52 = v_u_32.dots[v49 + 1]
		if v51 and v51.isActive then
			v51 = v_u_32.dots[v49 - 2]
		end
		if v52 and v52.isActive then
			v52 = v_u_32.dots[v49 + 2]
		end
		local v53 = ("Page%*"):format(v50.page)
		local v54 = v_u_3.createElement
		local v55 = v_u_10
		local v56 = {
			["LayoutOrder"] = v49,
			["scale"] = v50.size / v_u_28,
			["isActive"] = v50.isActive,
			["maxSize"] = v_u_28,
			["page"] = v50.page,
			["scaleEaseConfig"] = v45,
			["colorEaseConfig"] = v44
		}
		local v57
		if v50.isActive then
			v57 = nil
		else
			v57 = v_u_24.onActivated
		end
		v56.onActivated = v57
		local v58 = not v50.isActive
		if v58 then
			v58 = v_u_24.onActivated ~= nil
		end
		v56.Selectable = v58
		v56.NextSelectionUp = v_u_24.NextSelectionUp
		v56.NextSelectionDown = v_u_24.NextSelectionDown
		local v59
		if v51 == nil then
			v59 = v_u_24.NextSelectionLeft
		else
			v59 = v_u_36[v51.page]
		end
		v56.NextSelectionLeft = v59
		local v60
		if v52 == nil then
			v60 = v_u_24.NextSelectionRight
		else
			v60 = v_u_36[v52.page]
		end
		v56.NextSelectionRight = v60
		v56.ref = v_u_36[v50.page]
		v56.testId = ("%*--page-%*"):format(v_u_24.testId, v50.page)
		v48[v53] = v54(v55, v56)
	end
	local v61 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_27
		return {
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["Padding"] = UDim.new(0, v_u_27),
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
		}
	end, { v_u_27 })
	return v_u_3.createElement(v_u_6, v_u_8(v_u_24, {
		["tag"] = "auto-xy"
	}), {
		["Dots"] = v_u_3.createElement(v_u_6, {
			["tag"] = "auto-y",
			["Size"] = nil,
			["layout"] = nil,
			["Position"] = nil,
			["testId"] = nil,
			["Size"] = UDim2.fromOffset(v31, 0),
			["layout"] = v61,
			["Position"] = v_u_34:map(function(p62)
				return UDim2.fromOffset(p62, 0)
			end),
			["testId"] = ("%*--dots"):format(v_u_24.testId)
		}, v48)
	})
end))