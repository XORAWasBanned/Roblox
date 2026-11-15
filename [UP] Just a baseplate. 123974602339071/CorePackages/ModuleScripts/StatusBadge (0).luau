-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.StatusBadge.StatusBadge
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v4 = require(v1.Enums.StatusBadgeShape)
local v5 = require(v1.Enums.StatusBadgeSize)
local v6 = require(v1.Enums.StatusBadgeVariant)
local v_u_7 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_8 = require(v1.Components.View)
local v_u_9 = require(v1.Utility.useScaledValue)
local v_u_10 = require(script.Parent.useStatusBadgeVariants)
local v_u_11 = require(v1.Providers.Style.useTokens)
local v_u_12 = require(v1.Utility.withCommonProps)
local v_u_13 = require(v1.Utility.withDefaults)
local v_u_14 = {
	["variant"] = nil,
	["shape"] = nil,
	["size"] = nil,
	["testId"] = "--foundation-status-badge",
	["variant"] = v6.Standard,
	["shape"] = v4.Utility,
	["size"] = v5.Small
}
return v_u_3.memo(v_u_3.forwardRef(function(p15, p16) -- name: StatusBadge
	-- upvalues: (copy) v_u_13, (copy) v_u_14, (copy) v_u_11, (copy) v_u_10, (copy) v_u_9, (copy) v_u_3, (copy) v_u_8, (copy) v_u_12, (copy) v_u_7
	local v17 = v_u_13(p15, v_u_14)
	local v18 = v_u_10(v_u_11(), v17.variant, v17.shape, v17.size)
	local v19 = v_u_9(200)
	local v20 = v_u_3.createElement
	local v21 = v_u_8
	local v22 = v_u_12(v17, {
		["tag"] = v18.container.tag,
		["ref"] = p16
	})
	local v23 = {
		["Content"] = v_u_3.createElement(v_u_8, {
			["tag"] = nil,
			["layout"] = nil,
			["LayoutOrder"] = 1,
			["testId"] = nil,
			["tag"] = v18.content.tag,
			["layout"] = v18.content.gap and {
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["Padding"] = UDim.new(0, v18.content.gap)
			} or nil,
			["testId"] = ("%*--content"):format(v17.testId)
		}, {
			["StatusLight"] = v_u_3.createElement(v_u_8, {
				["tag"] = nil,
				["LayoutOrder"] = 1,
				["testId"] = nil,
				["tag"] = v18.statusLight.tag,
				["testId"] = ("%*--status-light"):format(v17.testId)
			}, {
				["Dot"] = v_u_3.createElement(v_u_8, {
					["tag"] = nil,
					["LayoutOrder"] = 1,
					["testId"] = nil,
					["tag"] = v18.dot.tag,
					["testId"] = ("%*--dot"):format(v17.testId)
				})
			}),
			["Text"] = v_u_3.createElement(v_u_7, {
				["Text"] = nil,
				["tag"] = nil,
				["textStyle"] = nil,
				["LayoutOrder"] = 2,
				["sizeConstraint"] = nil,
				["testId"] = nil,
				["Text"] = v17.text,
				["tag"] = v18.text.tag,
				["textStyle"] = v18.text.style,
				["sizeConstraint"] = {
					["MaxSize"] = Vector2.new(v19, (1 / 0))
				},
				["testId"] = ("%*--text"):format(v17.testId)
			})
		})
	}
	return v20(v21, v22, v23)
end))