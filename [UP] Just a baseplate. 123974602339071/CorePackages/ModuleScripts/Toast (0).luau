-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Toast.Toast
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v2.React)
local v_u_5 = require(v1.Utility.Logger)
local v_u_6 = require(v1.Components.Button)
local v_u_7 = require(v1.Components.Image)
local v_u_8 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_9 = require(v1.Components.View)
local v_u_10 = require(v1.Providers.Cursor.useCursor)
local v_u_11 = require(v1.Utility.useScaledValue)
local v_u_12 = require(v1.Providers.Style.useTokens)
local v_u_13 = require(v1.Utility.withCommonProps)
local v_u_14 = require(v1.Utility.withDefaults)
require(v1.Enums.ButtonVariant)
local v_u_15 = require(v1.Enums.FillBehavior)
local v_u_16 = require(v1.Enums.InputSize)
local v_u_17 = {
	["testId"] = "--foundation-toast"
}
return v_u_4.memo(v_u_4.forwardRef(function(p18, p19) -- name: Toast
	-- upvalues: (copy) v_u_14, (copy) v_u_17, (copy) v_u_12, (copy) v_u_10, (copy) v_u_4, (copy) v_u_5, (copy) v_u_16, (copy) v_u_15, (copy) v_u_3, (copy) v_u_6, (copy) v_u_11, (copy) v_u_9, (copy) v_u_13, (copy) v_u_7, (copy) v_u_8
	local v20 = v_u_14(p18, v_u_17)
	local v21 = v_u_12()
	local v22 = v_u_10({
		["radius"] = UDim.new(0, v21.Radius.Medium),
		["offset"] = v21.Size.Size_200,
		["borderWidth"] = v21.Stroke.Thicker
	})
	local v_u_23 = v20.actions
	local v29 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_23, (ref) v_u_5, (ref) v_u_16, (ref) v_u_15, (ref) v_u_3, (ref) v_u_4, (ref) v_u_6
		local v24 = {}
		if v_u_23 then
			for v25, v26 in v_u_23 do
				if v25 > 2 then
					v_u_5:warning((("Toast only supports up to %* actions"):format(2)))
					return v24
				end
				local v27 = {
					["LayoutOrder"] = #v_u_23 - v25,
					["size"] = v_u_16.Medium,
					["fillBehavior"] = v_u_15.Fill
				}
				local v28 = v_u_3.union(v26, v27)
				v24["ToastButton" .. v25] = v_u_4.createElement(v_u_6, v28)
			end
		end
		return v24
	end, { v_u_23 })
	local v30 = v20.icon
	if v30 then
		v30 = v20.icon ~= ""
	end
	local v31 = v20.title
	if v31 then
		v31 = v20.title ~= ""
	end
	local v32 = v20.text
	if v32 then
		v32 = v20.text ~= ""
	end
	local v33 = v20.width or UDim.new(0, v_u_11(400))
	local v34 = v_u_4.createElement
	local v35 = v_u_9
	local v36 = v_u_13(v20, {
		["Size"] = nil,
		["Position"] = nil,
		["selection"] = nil,
		["tag"] = "row gap-small auto-y padding-medium radius-medium bg-over-media-0",
		["ref"] = nil,
		["Size"] = UDim2.new(v33, UDim.new()),
		["Position"] = UDim2.fromScale(0.5, 0.1),
		["selection"] = {
			["Selectable"] = false,
			["SelectionImageObject"] = nil,
			["SelectionImageObject"] = v22
		},
		["ref"] = p19
	})
	local v37 = {}
	local v38
	if v30 then
		v38 = v_u_4.createElement(v_u_7, {
			["LayoutOrder"] = 1,
			["Image"] = nil,
			["tag"] = "size-1200-1200",
			["testId"] = nil,
			["Image"] = v20.icon,
			["testId"] = ("%*--media"):format(v20.testId)
		})
	else
		v38 = nil
	end
	v37.Media = v38
	local v39 = v_u_4.createElement
	local v40 = v_u_9
	local v41 = {
		["LayoutOrder"] = 2,
		["tag"] = nil,
		["testId"] = nil,
		["tag"] = {
			["fill self-center auto-y"] = true,
			["col gap-xxsmall"] = v31 or v32
		},
		["testId"] = ("%*--content"):format(v20.testId)
	}
	local v42 = {}
	local v43
	if v31 then
		v43 = v_u_4.createElement(v_u_8, {
			["LayoutOrder"] = 1,
			["Text"] = nil,
			["tag"] = "size-full-0 auto-y text-title-small text-align-x-left text-truncate-end content-emphasis",
			["testId"] = nil,
			["Text"] = v20.title,
			["testId"] = ("%*--header"):format(v20.testId)
		})
	else
		v43 = nil
	end
	v42.Header = v43
	local v44
	if v32 then
		v44 = v_u_4.createElement(v_u_8, {
			["LayoutOrder"] = 2,
			["Text"] = nil,
			["tag"] = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-default",
			["testId"] = nil,
			["Text"] = v20.text,
			["testId"] = ("%*--body"):format(v20.testId)
		})
	else
		v44 = nil
	end
	v42.Body = v44
	local v45
	if v_u_23 and #v_u_23 > 0 then
		v45 = v_u_4.createElement(v_u_9, {
			["LayoutOrder"] = 3,
			["tag"] = nil,
			["testId"] = nil,
			["tag"] = {
				["row gap-small size-full-0 auto-y"] = true,
				["padding-top-small"] = v31 or v32
			},
			["testId"] = ("%*--actions"):format(v20.testId)
		}, v29)
	else
		v45 = nil
	end
	v42.Actions = v45
	v37.Content = v39(v40, v41, v42)
	return v34(v35, v36, v37)
end))