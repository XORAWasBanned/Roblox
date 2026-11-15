-- Path: CorePackages.Packages._Index.Markdown.Markdown.Utils.shouldUseTopPadding
local v1 = script:FindFirstAncestor("Markdown")
require(v1.Types)
return function(p2) -- name: shouldUseTopPadding
	return p2.offset ~= 0
end