-- Path: CorePackages.Packages._Index.Markdown.Markdown.Components.NodeRenderers.renderTag
local v1 = script:FindFirstAncestor("Markdown")
local v2 = v1.Parent
require(v1.Types)
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.Foundation)
local v_u_5 = require(v2.Dash)
local v_u_6 = require(v2.MarkdownCore).Flags
local v_u_7 = require(v2.InlineLayout).Components.InlineLayoutElements.ImageElement
local v_u_8 = require(v1.Utils.joinTags)
local v_u_9 = require(v1.Utils.mergeContexts)
local v_u_10 = require(v1.Enums.NodeType)
local function v11() -- name: bold
	return {
		["bold"] = true
	}
end
local function v12() -- name: italic
	return {
		["italic"] = true
	}
end
local function v13() -- name: strike
	return {
		["strike"] = true
	}
end
local function v15(p14) -- name: code
	-- upvalues: (copy) v_u_5
	return v_u_5.joinDeep(p14.codeStyles, {
		["selectable"] = true
	})
end
local v_u_16 = {
	["b"] = v11,
	["strong"] = v11,
	["i"] = v12,
	["em"] = v12,
	["s"] = v13,
	["del"] = v13,
	["strike"] = v13,
	["code"] = v15,
	["kbd"] = v15
}
return function(p_u_17, p_u_18) -- name: renderTag
	-- upvalues: (copy) v_u_7, (copy) v_u_3, (copy) v_u_8, (copy) v_u_4, (copy) v_u_9, (copy) v_u_6, (copy) v_u_5, (copy) v_u_10, (copy) v_u_16
	if p_u_17.text ~= "img" then
		if p_u_17.text == "Button" then
			if not (p_u_17.attributes and (p_u_17.attributes.text and p_u_17.attributes.url)) then
				warn("Button tag misses required text and url attributes")
				return nil
			end
			local v19 = v_u_3.createElement
			local v20 = v_u_4.Button
			local v21 = {
				["key"] = nil,
				["LayoutOrder"] = nil,
				["text"] = nil,
				["icon"] = nil,
				["onActivated"] = nil,
				["tag"] = "auto-xy"
			}
			local v22 = p_u_17.index
			v21.key = tostring(v22)
			v21.LayoutOrder = p_u_17.index
			v21.text = p_u_17.attributes.text
			v21.icon = p_u_17.attributes.icon
			function v21.onActivated() -- name: onActivated
				-- upvalues: (copy) p_u_18, (copy) p_u_17
				p_u_18.linkCallback(p_u_17.attributes.url)
			end
			return v19(v20, v21)
		end
		if p_u_17.text == "font" then
			local v23
			if p_u_17.attributes and p_u_17.attributes.color then
				v23 = p_u_17.attributes.color
			else
				v23 = nil
			end
			return p_u_18.processChildren(p_u_17, v_u_9(p_u_18, {
				["textStyles"] = {
					["color"] = v23
				}
			}))
		end
		if not v_u_6.FFlagMarkdownTagFallbacks then
			return nil
		end
		local v24 = p_u_17.attributes
		if v24 then
			v24 = p_u_17.attributes.href
		end
		if p_u_17.text == "a" and (v24 and (p_u_18.renderers and p_u_18.renderers.LINK)) then
			return p_u_18.renderers.LINK(v_u_5.join(p_u_17, {
				["attributes"] = v_u_5.join(p_u_17.attributes, {
					["url"] = v24
				})
			}), p_u_18)
		end
		if p_u_17.type == v_u_10.InlineSpan then
			local v25 = v_u_16[p_u_17.text]
			local v26 = not v25 and {} or v25(p_u_18)
			return p_u_18.processChildren(p_u_17, v_u_9(p_u_18, {
				["textStyles"] = v26
			}))
		end
		local v27 = v_u_3.createElement
		local v28 = v_u_4.View
		local v29 = {
			["key"] = nil,
			["tag"] = "size-full-0 auto-y col",
			["LayoutOrder"] = nil
		}
		local v30 = p_u_17.index
		v29.key = tostring(v30)
		v29.LayoutOrder = p_u_17.index
		return v27(v28, v29, (p_u_18.processChildren(p_u_17, p_u_18)))
	end
	local v31 = p_u_18.imageStyles.size
	local v32
	if p_u_17.attributes and p_u_17.attributes.width then
		v32 = p_u_17.attributes.width
	else
		v32 = v31.Width.Offset
	end
	local v33
	if p_u_17.attributes and p_u_17.attributes.height then
		v33 = p_u_17.attributes.height
	else
		v33 = v31.Height.Offset
	end
	if p_u_18.isInline then
		return v_u_7.new({
			["LayoutOrder"] = p_u_17.index,
			["Image"] = not (p_u_17.attributes and p_u_17.attributes.src) and "" or p_u_17.attributes.src,
			["Size"] = UDim2.fromOffset(v32, v33),
			["backgroundStyle"] = {
				["Transparency"] = p_u_18.imageStyles.backgroundTransparency,
				["Color3"] = p_u_18.imageStyles.backgroundColor3
			},
			["imageStyle"] = {
				["Transparency"] = p_u_18.imageStyles.transparency
			},
			["ScaleType"] = p_u_18.imageStyles.scaleType,
			["ResampleMode"] = p_u_18.imageStyles.resampleMode,
			["tag"] = p_u_18.imageStyles.tags
		})
	end
	local v34 = v_u_3.createElement
	local v35 = {}
	local v36 = p_u_17.index
	v35.key = tostring(v36)
	v35.LayoutOrder = p_u_17.index
	v35.Image = not (p_u_17.attributes and p_u_17.attributes.src) and "" or p_u_17.attributes.src
	v35.Size = UDim2.fromOffset(v32, v33)
	v35.BackgroundColor3 = p_u_18.imageStyles.backgroundColor3
	v35.BackgroundTransparency = p_u_18.imageStyles.backgroundTransparency
	v35.ImageTransparency = p_u_18.imageStyles.transparency
	v35.ScaleType = p_u_18.imageStyles.scaleType
	v35.ResampleMode = p_u_18.imageStyles.resampleMode
	v35[v_u_3.Tag] = v_u_8("X-PadS X-Middle", p_u_18.imageStyles.tags)
	return v34("ImageLabel", v35)
end