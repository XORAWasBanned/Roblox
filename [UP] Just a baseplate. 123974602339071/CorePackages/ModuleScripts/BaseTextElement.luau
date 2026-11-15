-- Path: CorePackages.Packages._Index.InlineLayout.InlineLayout.Components.InlineLayout.InlineLayoutElements.BaseTextElement
local v1 = script:FindFirstAncestor("Components").Parent
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.Dash)
local v5 = require(v2.MarkdownCore).Utils.isCli
local v_u_6 = require(v1.Enums.TextSplitBy)
local v_u_7 = require(v1.Utils.SplitText)
require(v1.Types)
local v_u_8 = require(v2.MarkdownCore).Utils.Escape
local v9 = require(v1.Utils.InlineElementType)
local v_u_10 = require(v1.Utils.getFontFace)
local v_u_11 = v_u_4.join
local v_u_12 = {}
local v_u_13 = {}
v_u_13.__index = v_u_13
v_u_13.__type = v9
function v_u_13.new(p14, p15, p16) -- name: new
	-- upvalues: (copy) v_u_13, (copy) v_u_4, (copy) v_u_6, (copy) v_u_8
	local v17 = v_u_13
	local v18 = setmetatable({}, v17)
	v18.props = p15
	v18.mapProps = p16 or v_u_4.identity
	v18.Element = p14
	v18.canForceSplit = v18.splitBy ~= v_u_6.Symbol
	local v19
	if v18.props.SplitBy then
		v19 = v18.props.SplitBy
	else
		v19 = v_u_6.Word
	end
	v18.splitBy = v19
	local v20
	if v18.props.EngineTags == nil then
		v20 = false
	else
		v20 = next(v18.props.EngineTags) ~= nil
	end
	v18.hasRichText = v20
	if v18.hasRichText and v18.props.Text then
		v18.props = v_u_4.assign(v18.props, {
			["Text"] = v_u_8.unescapeRichFormatting(v18.props.Text)
		})
	end
	return v18
end
function v_u_13._clone(p21, p22) -- name: _clone
	-- upvalues: (copy) v_u_13
	return v_u_13.new(p21.Element, p22 or p21.props, p21.mapProps)
end
local v_u_23 = game:GetService("TextService")
if v5() then
	local v24 = {}
	v24.__index = v24
	v_u_23 = setmetatable({}, v24)
	function v24.GetTextBoundsAsync(_) -- name: GetTextBoundsAsync
		return {
			["X"] = 100
		}
	end
end
function v_u_13.getWidth(p25) -- name: getWidth
	return p25:_getWidth(p25.props.Text)
end
function v_u_13._getWidth(p26, p27) -- name: _getWidth
	-- upvalues: (copy) v_u_10, (copy) v_u_8, (copy) v_u_4, (ref) v_u_23, (copy) v_u_12
	local v_u_28 = Instance.new("GetTextBoundsParams")
	v_u_28.Font = v_u_10(p26.props.fontStyle)
	v_u_28.Size = p26.props.fontStyle.FontSize
	v_u_28.Text = p27
	if p26.hasRichText then
		local v29 = p26.props.EngineTags
		local v30 = v_u_8.escapeRichFormatting(p27)
		v_u_28.Text = v_u_4.reduce(v29, function(p31, p32)
			-- upvalues: (ref) v_u_4
			local v37 = v_u_4.reduce(p32.attributes, function(p33, p34, p35)
				local v36 = string.find(p34, "\"") and "\'" or "\""
				return ("%* %*=%*%*%*"):format(p33, p35, v36, p34, v36)
			end, "")
			return ("<%*%*>%*</%*>"):format(p32.name, v37, p31, p32.name)
		end, v30)
		v_u_28.RichText = true
	end
	local function v38()
		-- upvalues: (ref) v_u_23, (copy) v_u_28
		return v_u_23:GetTextBoundsAsync(v_u_28).X
	end
	local v39, v40 = pcall(v38)
	if v39 then
		return v40
	end
	if not v_u_12[v_u_28.Text] then
		v_u_12[v_u_28.Text] = true
		warn((("Failed to get width for the %* in BaseTextElement"):format(v_u_28.Text)))
	end
	v_u_28.RichText = false
	return v_u_23:GetTextBoundsAsync(v_u_28).X
end
function v_u_13.split(p_u_41, p42, p43) -- name: split
	-- upvalues: (copy) v_u_7, (copy) v_u_6, (copy) v_u_11
	local v44 = v_u_7
	local v45
	if p_u_41.canForceSplit and p43 then
		v45 = v_u_6.Symbol
	else
		v45 = p_u_41.splitBy
	end
	local v47, v48 = v44(v45, function(p46)
		-- upvalues: (copy) p_u_41
		return p_u_41:_getWidth(p46)
	end, p_u_41.props.Text, p42)
	local v49 = p_u_41:_clone(v_u_11(p_u_41.props, {
		["Text"] = v47
	}))
	if v48 then
		return v49, p_u_41:_clone(v_u_11(p_u_41.props, {
			["Text"] = v48:gsub("^%s*", "")
		}))
	else
		return v49, nil
	end
end
function v_u_13.trimStart(p50) -- name: trimStart
	-- upvalues: (copy) v_u_11
	local v51 = p50.props.Text
	if v51 == nil then
		return p50
	else
		local v52 = v51:gsub("^%s+", "")
		if v52 == "" then
			return nil
		elseif v52 == v51 then
			return p50
		else
			return p50:_clone(v_u_11(p50.props, {
				["Text"] = v52
			}))
		end
	end
end
function v_u_13.render(p53, p54, p55) -- name: render
	-- upvalues: (copy) v_u_8, (copy) v_u_4, (copy) v_u_3, (copy) v_u_11
	local v56 = p53.props.Text
	if p53.hasRichText and (p53.props.Text and p53.props.EngineTags) then
		local v57 = p53.props.Text
		local v58 = p53.props.EngineTags
		local v59 = v_u_8.escapeRichFormatting(v57)
		v56 = v_u_4.reduce(v58, function(p60, p61)
			-- upvalues: (ref) v_u_4
			local v66 = v_u_4.reduce(p61.attributes, function(p62, p63, p64)
				local v65 = string.find(p63, "\"") and "\'" or "\""
				return ("%* %*=%*%*%*"):format(p62, p64, v65, p63, v65)
			end, "")
			return ("<%*%*>%*</%*>"):format(p61.name, v66, p60, p61.name)
		end, v59)
	end
	return v_u_3.createElement(p53.Element, p53.mapProps(v_u_11(p53.props, {
		["id"] = p54,
		["Text"] = v56,
		["RichText"] = p53.hasRichText,
		["AutomaticSize"] = Enum.AutomaticSize.XY,
		["LayoutOrder"] = p55,
		["key"] = tostring(p55),
		["EngineTags"] = v_u_4.None
	})))
end
return v_u_13