-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Banner.Subcomponents.UpsellContent
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v2.BuilderIcons)
local v_u_4 = require(v2.React)
local v_u_5 = require(v1.Enums.ButtonVariant)
local v_u_6 = require(v1.Enums.InputSize)
local v_u_7 = require(v1.Components.Icon)
local v_u_8 = require(v1.Components.IconButton)
local v_u_9 = require(v1.Components.Text)
local v_u_10 = require(v1.Components.View)
local v_u_11 = require(v1.Providers.Style.useTokens)
local v_u_12 = require(script.Parent.Thumbnail)
local v_u_13 = require(script.Parent.useUpsellContentVariants)
local v_u_14 = v3.Icon
return function(p15) -- name: UpsellContent
	-- upvalues: (copy) v_u_11, (copy) v_u_13, (copy) v_u_4, (copy) v_u_10, (copy) v_u_12, (copy) v_u_9, (copy) v_u_7, (copy) v_u_14, (copy) v_u_8, (copy) v_u_5, (copy) v_u_6
	local v16 = v_u_13(v_u_11(), p15.density)
	local v17 = p15.onActivated ~= nil
	local v18 = v_u_4.createElement
	local v19 = v_u_10
	local v20 = {
		["tag"] = nil,
		["LayoutOrder"] = 1,
		["testId"] = nil,
		["tag"] = v16.container.tag,
		["testId"] = ("%*--upsell-content"):format(p15.testId)
	}
	local v21 = {}
	local v22
	if p15.thumbnail then
		v22 = v_u_4.createElement(v_u_12, {
			["thumbnail"] = nil,
			["density"] = nil,
			["testId"] = nil,
			["LayoutOrder"] = 1,
			["thumbnail"] = p15.thumbnail,
			["density"] = p15.density,
			["testId"] = p15.testId
		})
	else
		v22 = nil
	end
	v21.Thumbnail = v22
	local v23 = v_u_4.createElement
	local v24 = v_u_10
	local v25 = {
		["tag"] = nil,
		["LayoutOrder"] = 2,
		["testId"] = nil,
		["tag"] = v16.content.tag,
		["testId"] = ("%*--upsell-content--body"):format(p15.testId)
	}
	local v26 = {}
	local v27
	if p15.title then
		v27 = v_u_4.createElement(v_u_9, {
			["Text"] = nil,
			["tag"] = nil,
			["LayoutOrder"] = 1,
			["testId"] = nil,
			["Text"] = p15.title,
			["tag"] = v16.title.tag,
			["testId"] = ("%*--title"):format(p15.testId)
		})
	else
		v27 = nil
	end
	v26.Title = v27
	local v28
	if p15.description then
		v28 = v_u_4.createElement(v_u_9, {
			["Text"] = nil,
			["TextTruncate"] = nil,
			["sizeConstraint"] = nil,
			["tag"] = nil,
			["LayoutOrder"] = 2,
			["testId"] = nil,
			["Text"] = p15.description,
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["sizeConstraint"] = v16.description.sizeConstraint,
			["tag"] = v16.description.tag,
			["testId"] = ("%*--description"):format(p15.testId)
		})
	else
		v28 = nil
	end
	v26.Description = v28
	v21.Content = v23(v24, v25, v26)
	local v29
	if v17 then
		v29 = v_u_4.createElement(v_u_7, {
			["name"] = nil,
			["LayoutOrder"] = 3,
			["testId"] = nil,
			["name"] = v_u_14.ChevronSmallRight,
			["testId"] = ("%*--chevron"):format(p15.testId)
		})
	else
		v29 = nil
	end
	v21.Chevron = v29
	local v30
	if p15.onClose and not v17 then
		v30 = v_u_4.createElement(v_u_8, {
			["onActivated"] = nil,
			["icon"] = nil,
			["variant"] = nil,
			["size"] = nil,
			["isCircular"] = true,
			["LayoutOrder"] = 4,
			["testId"] = nil,
			["onActivated"] = p15.onClose,
			["icon"] = v_u_14.X,
			["variant"] = v_u_5.Utility,
			["size"] = v_u_6.Small,
			["testId"] = ("%*--close"):format(p15.testId)
		})
	else
		v30 = nil
	end
	v21.Close = v30
	return v18(v19, v20, v21)
end