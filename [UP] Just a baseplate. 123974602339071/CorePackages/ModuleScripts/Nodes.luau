-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.node.Nodes
local v1 = script:FindFirstAncestor("CommonMark")
local v2 = require(v1.node.BlockQuote)
local v3 = require(v1.node.BulletList)
local v4 = require(v1.node.Code)
require(v1.node.CustomBlock)
require(v1.node.CustomNode)
require(v1.node.Delimited)
local v5 = require(v1.node.Document)
local v6 = require(v1.node.Emphasis)
local v7 = require(v1.node.FencedCodeBlock)
local v8 = require(v1.node.HardLineBreak)
local v9 = require(v1.node.Heading)
local v10 = require(v1.node.HtmlBlock)
local v11 = require(v1.node.HtmlInline)
local v12 = require(v1.node.Image)
local v13 = require(v1.node.IndentedCodeBlock)
local v14 = require(v1.node.Link)
local v15 = require(v1.node.LinkReferenceDefinition)
require(v1.node.ListBlock)
local v16 = require(v1.node.ListItem)
require(v1.node.Node)
return {
	["BlockQuote"] = v2,
	["BulletList"] = v3,
	["Code"] = v4,
	["Document"] = v5,
	["Emphasis"] = v6,
	["FencedCodeBlock"] = v7,
	["HardLineBreak"] = v8,
	["Heading"] = v9,
	["HtmlBlock"] = v10,
	["HtmlInline"] = v11,
	["Image"] = v12,
	["IndentedCodeBlock"] = v13,
	["Link"] = v14,
	["LinkReferenceDefinition"] = v15,
	["ListItem"] = v16,
	["OrderedList"] = require(v1.node.OrderedList),
	["Paragraph"] = require(v1.node.Paragraph),
	["SoftLineBreak"] = require(v1.node.SoftLineBreak),
	["StrongEmphasis"] = require(v1.node.StrongEmphasis),
	["Text"] = require(v1.node.Text),
	["ThematicBreak"] = require(v1.node.ThematicBreak),
	["between"] = function(p17, p_u_18) -- name: between
		local v_u_19 = p17:getNext()
		return function()
			-- upvalues: (ref) v_u_19, (copy) p_u_18
			if v_u_19 == nil or v_u_19 == p_u_18 then
				return nil
			end
			local v20 = v_u_19
			v_u_19 = v20:getNext()
			return v20
		end
	end
}