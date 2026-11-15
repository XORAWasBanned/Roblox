-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Metadata.Metadata
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Enums.AccessoryType)
local v_u_5 = require(v1.Components.AvatarIcon)
local v_u_6 = require(v1.Components.Icon)
local v7 = require(v1.Enums.MetadataSize)
local v_u_8 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_9 = require(v1.Components.View)
local v_u_10 = require(v1.Utility.getMultiLineTextHeight)
local v_u_11 = require(v1.Providers.Style.useTextSizeOffset)
local v_u_12 = require(v1.Providers.Style.useTokens)
local v_u_13 = require(v1.Utility.withCommonProps)
local v_u_14 = require(v1.Utility.withDefaults)
local v_u_15 = require(script.Parent.useMetadataVariants)
local v_u_16 = {
	["size"] = nil,
	["maxLines"] = 1,
	["hasSeparator"] = true,
	["testId"] = "--foundation-metadata",
	["size"] = v7.Medium
}
local function v_u_25(p17) -- name: MetadataAccessoryElement
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_9, (copy) v_u_5, (copy) v_u_6
	local v18 = p17.variant
	local v19 = p17.config
	local v20
	if type(v19) == "string" then
		v20 = {
			["iconName"] = p17.config
		}
	else
		v20 = p17.config
	end
	if v20.type ~= v_u_4.Avatar then
		return v_u_3.createElement(v_u_6, {
			["name"] = v20.iconName,
			["variant"] = v20.iconVariant,
			["size"] = v18.iconSize,
			["style"] = v18.style,
			["LayoutOrder"] = p17.LayoutOrder,
			["testId"] = p17.testId
		})
	end
	local v21 = v_u_3.createElement
	local v22 = v_u_9
	local v23 = {
		["tag"] = v18.avatarTag,
		["LayoutOrder"] = p17.LayoutOrder
	}
	local v24 = {
		["Avatar"] = v_u_3.createElement(v_u_5, {
			["userId"] = v20.userId,
			["size"] = v18.avatarSize,
			["testId"] = p17.testId
		})
	}
	return v21(v22, v23, v24)
end
return v_u_3.memo(v_u_3.forwardRef(function(p26, p27) -- name: Metadata
	-- upvalues: (copy) v_u_14, (copy) v_u_16, (copy) v_u_12, (copy) v_u_11, (copy) v_u_15, (copy) v_u_10, (copy) v_u_3, (copy) v_u_8, (copy) v_u_25, (copy) v_u_9, (copy) v_u_13
	local v28 = v_u_14(p26, v_u_16)
	local v29 = v_u_12()
	local v30 = v_u_11()
	local v31 = v_u_15(v29, v28.size, not v28.hasSeparator)
	local v32 = v31.text.fontStyle
	local v33 = v28.text
	local v34 = type(v33) == "string" and true or v28.text.text ~= nil
	local v35
	if v34 then
		v35 = { v28.text }
	else
		v35 = v28.text
	end
	local v36 = {}
	for _, v37 in v35 do
		local v38 = type(v37) == "string" and {
			["text"] = v37
		} or v37
		table.insert(v36, v38)
	end
	local v39 = #v36
	local v40 = v28.truncateIndex or v39
	local v41 = math.max(v39, 1)
	local v42 = math.clamp(v40, 1, v41)
	local v43
	if v34 then
		local v44 = v28.maxLines
		v43 = math.max(v44, 1)
	else
		v43 = 1
	end
	local v45 = v_u_10((v32.FontSize or 0) + v30, v43, v32.LineHeight or 1)
	local v46 = {}
	for v47, v48 in v36 do
		if v47 > 1 and v28.hasSeparator then
			v46[("Separator%*"):format(v47 - 1)] = v_u_3.createElement(v_u_8, {
				["Text"] = "\194\183",
				["tag"] = nil,
				["LayoutOrder"] = nil,
				["testId"] = nil,
				["tag"] = v31.text.tag,
				["LayoutOrder"] = v47 * 2 - 1,
				["testId"] = ("%*--separator-%*"):format(v28.testId, v47 - 1)
			})
		end
		local v49
		if v48.leading then
			v49 = v_u_3.createElement(v_u_25, {
				["config"] = nil,
				["variant"] = nil,
				["LayoutOrder"] = 1,
				["testId"] = nil,
				["config"] = v48.leading,
				["variant"] = v31.accessory,
				["testId"] = ("%*--item-%*--leading"):format(v28.testId, v47)
			})
		else
			v49 = nil
		end
		local v50
		if v47 == v39 and v28.trailing then
			v50 = v_u_3.createElement(v_u_25, {
				["config"] = nil,
				["variant"] = nil,
				["LayoutOrder"] = 4,
				["testId"] = nil,
				["config"] = v28.trailing,
				["variant"] = v31.accessory,
				["testId"] = ("%*--trailing"):format(v28.testId)
			})
		else
			v50 = nil
		end
		local v51 = ("Item%*"):format(v47)
		local v52 = v_u_3.createElement
		local v53 = v_u_9
		local v54 = {}
		local v55
		if v47 == v42 then
			v55 = v31.truncatedItem.tag
		else
			v55 = v31.item.tag
		end
		v54.tag = v55
		v54.LayoutOrder = v47 * 2
		v54.testId = ("%*--item-%*"):format(v28.testId, v47)
		local v56 = {
			["Leading"] = v49
		}
		local v57 = v_u_3.createElement
		local v58 = v_u_8
		local v59 = {
			["Text"] = nil,
			["tag"] = nil,
			["sizeConstraint"] = nil,
			["LayoutOrder"] = 3,
			["testId"] = nil,
			["Text"] = v48.text
		}
		local v60
		if v43 > 1 then
			v60 = v31.wrappedText.tag
		elseif v47 == v42 then
			v60 = v31.truncatedText.tag
		else
			v60 = v31.text.tag
		end
		v59.tag = v60
		v59.sizeConstraint = v43 > 1 and {
			["MaxSize"] = Vector2.new((1 / 0), v45)
		} or nil
		v59.testId = ("%*--text-%*"):format(v28.testId, v47)
		v56.Text = v57(v58, v59)
		v56.Trailing = v50
		v46[v51] = v52(v53, v54, v56)
	end
	return v_u_3.createElement(v_u_9, v_u_13(v28, {
		["tag"] = v31.container.tag,
		["ref"] = p27
	}), v46)
end))