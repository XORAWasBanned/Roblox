-- Path: CorePackages.Packages._Index.Markdown.Markdown.Parsers.RobloxMarkdown.Underline.UnderlineDelimiterProcessor
local v1 = script:FindFirstAncestor("Markdown").Parent
local v_u_2 = require(v1.CommonMark)
local v_u_3 = require(script.Parent.Underline)
return {
	["new"] = function() -- name: new
		-- upvalues: (copy) v_u_2, (copy) v_u_3
		local v4 = {
			["minLength"] = 2,
			["createStrongEmphasis"] = nil,
			["createStrongEmphasis"] = v_u_3
		}
		return v_u_2.Parser.Delimiter.EmphasisLikeDelimiterProcessor.new(95, v4)
	end
}