-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Card.Card
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v4 = require(v1.Enums.CardDensity)
local v5 = require(v1.Enums.CardHeaderSize)
local v_u_6 = require(v1.Enums.CardHeight)
local v7 = require(v1.Enums.CardMediaAspectRatio)
local v_u_8 = require(v1.Enums.CardMediaPlacement)
local v9 = require(v1.Enums.CardVariant)
local v_u_10 = require(script.Parent.Subcomponents.CardActions)
local v_u_11 = require(script.Parent.Subcomponents.CardHeader)
local v_u_12 = require(script.Parent.Subcomponents.CardMedia)
require(v1.Components.Types)
local v_u_13 = require(v1.Components.View)
local v_u_14 = require(script.Parent.useCardVariants)
local v_u_15 = require(v1.Providers.Style.useTokens)
local v_u_16 = require(v1.Utility.withCommonProps)
local v_u_17 = require(v1.Utility.withDefaults)
local v_u_18 = v7.Ratio2x1
local v_u_19 = {
	[v7.Ratio1x1] = 1,
	[v7.Ratio5x4] = 1.25,
	[v7.Ratio4x3] = 1.3333333333333333,
	[v7.Ratio3x2] = 1.5,
	[v7.Ratio16x9] = 1.7777777777777777,
	[v7.Ratio2x1] = 2
}
local v_u_20 = {
	["variant"] = nil,
	["density"] = nil,
	["height"] = nil,
	["testId"] = "--foundation-card",
	["variant"] = v9.Standard,
	["density"] = v4.Default,
	["height"] = v_u_6.Fit
}
local v_u_21 = {
	[v4.Compact] = v5.Small,
	[v4.Default] = v5.Medium,
	[v4.Comfortable] = v5.Large
}
local function v_u_26(p22) -- name: resolveMedia
	-- upvalues: (copy) v_u_8, (copy) v_u_19, (copy) v_u_18
	if typeof(p22) == "string" then
		return {
			["src"] = nil,
			["placement"] = nil,
			["width"] = 136,
			["aspectRatio"] = nil,
			["src"] = p22,
			["placement"] = v_u_8.End,
			["aspectRatio"] = v_u_19[v_u_18]
		}
	end
	if typeof(p22) ~= "table" then
		return nil
	end
	local v23 = p22.placement or v_u_8.End
	local v24 = (v23 ~= v_u_8.End or p22.width == nil) and 136 or p22.width
	local v25
	if v23 == v_u_8.Bottom and p22.aspectRatio ~= nil then
		v25 = p22.aspectRatio
	else
		v25 = v_u_18
	end
	return {
		["src"] = p22.image,
		["placement"] = v23,
		["width"] = v24,
		["aspectRatio"] = v_u_19[v25]
	}
end
return v_u_3.memo(v_u_3.forwardRef(function(p27, p28) -- name: Card
	-- upvalues: (copy) v_u_17, (copy) v_u_20, (copy) v_u_15, (copy) v_u_21, (copy) v_u_26, (copy) v_u_8, (copy) v_u_6, (copy) v_u_14, (copy) v_u_3, (copy) v_u_10, (copy) v_u_13, (copy) v_u_16, (copy) v_u_11, (copy) v_u_12
	local v29 = v_u_17(p27, v_u_20)
	local v30 = v_u_15()
	local v31 = v29.headerSize or v_u_21[v29.density]
	local v32 = v29.title ~= nil and true or v29.description ~= nil
	local v33 = v_u_26(v29.media)
	local v34
	if v33 == nil then
		v34 = false
	else
		v34 = v33.placement == v_u_8.End
	end
	local v35 = v29.onOverflow ~= nil and true or v29.onClose ~= nil
	local v36
	if v32 then
		v36 = not v34
	else
		v36 = v32
	end
	local v37 = v29.height == v_u_6.Fill
	local v38
	if v29.eyebrow == nil or v29.title == nil then
		v38 = v29.description == nil
	else
		v38 = false
	end
	local v39 = v_u_14(v30, v29.variant, v29.density, v31, v29.height, v34, v38, v36)
	local v40, v_u_41 = v_u_3.useState(0)
	local v42, v_u_43 = v_u_3.useState(0)
	local v47 = v_u_3.useCallback(function(p44)
		-- upvalues: (copy) v_u_41
		local v_u_45 = p44.AbsoluteSize.X
		v_u_41(function(p46)
			-- upvalues: (copy) v_u_45
			if p46 == v_u_45 then
				return p46
			else
				return v_u_45
			end
		end)
	end, {})
	local v49 = v_u_3.useCallback(function(p48)
		-- upvalues: (copy) v_u_43
		v_u_43(p48.AbsoluteSize.Y)
	end, {})
	local v50
	if v35 then
		v50 = v_u_3.createElement(v_u_10, {
			["testId"] = v29.testId,
			["variantProps"] = v39,
			["onOverflow"] = v29.onOverflow,
			["onClose"] = v29.onClose,
			["overflowRef"] = v29.overflowRef,
			["isOverMedia"] = v34,
			["isInline"] = v36
		})
	else
		v50 = nil
	end
	local v51
	if v33 == nil or v33.placement ~= v_u_8.Bottom then
		v51 = 0
	else
		local v52 = v40 / v33.aspectRatio
		v51 = math.round(v52)
	end
	local v53 = v42 + v51
	local v54 = v_u_3.createElement
	local v55 = v_u_13
	local v56 = v_u_16(v29, {
		["tag"] = v39.container.tag,
		["sizeConstraint"] = v37 and {
			["MinSize"] = Vector2.new(0, v53)
		} or nil,
		["onActivated"] = v29.onActivated,
		["ref"] = p28
	})
	local v57 = {}
	local v58 = v_u_3.createElement
	local v59 = v_u_13
	local v60 = {
		["tag"] = v39.body.tag,
		["onAbsoluteSizeChanged"] = v47
	}
	local v61 = {}
	local v62 = v_u_3.createElement
	local v63 = v_u_13
	local v64 = {
		["tag"] = nil,
		["onAbsoluteSizeChanged"] = nil,
		["LayoutOrder"] = 1,
		["tag"] = v39.content.tag,
		["onAbsoluteSizeChanged"] = v49
	}
	local v65 = {}
	local v66
	if v32 then
		local v67 = v_u_3.createElement
		local v68 = v_u_11
		local v69 = {
			["testId"] = v29.testId,
			["variantProps"] = v39,
			["eyebrow"] = v29.eyebrow,
			["icon"] = v29.icon,
			["title"] = v29.title,
			["description"] = v29.description
		}
		local v70
		if v29.lineClamp then
			v70 = v29.lineClamp.description
		else
			v70 = nil
		end
		v69.descriptionLineClamp = v70
		local v71
		if v36 then
			v71 = v50
		else
			v71 = nil
		end
		v69.actions = v71
		v66 = v67(v68, v69)
	else
		v66 = nil
	end
	v65.Header = v66
	local v72
	if v29.children then
		v72 = v_u_3.createElement(v_u_13, {
			["tag"] = nil,
			["LayoutOrder"] = 2,
			["testId"] = nil,
			["tag"] = v39.children.tag,
			["testId"] = ("%*--content"):format(v29.testId)
		}, v29.children)
	else
		v72 = nil
	end
	v65.Children = v72
	v61.Content = v62(v63, v64, v65)
	local v73
	if v33 then
		v73 = v_u_3.createElement(v_u_12, {
			["image"] = v33.src,
			["width"] = v33.width,
			["isEnd"] = v34,
			["isFillHeight"] = v37,
			["bottomHeight"] = v51,
			["tag"] = v39.media.tag,
			["testId"] = v29.testId
		})
	else
		v73 = nil
	end
	v61.Media = v73
	v57.Body = v58(v59, v60, v61)
	if v36 then
		v50 = nil
	end
	v57.Actions = v50
	return v54(v55, v56, v57)
end))