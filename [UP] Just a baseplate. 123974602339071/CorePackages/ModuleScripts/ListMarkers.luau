-- Path: CorePackages.Packages._Index.Markdown.Markdown.Adapter.ListMarkers
local v1 = script:FindFirstAncestor("Markdown").Parent
require(v1.CommonMark)
return {
	["startNumber"] = function(p2) -- name: startNumber
		return p2.kind == "OrderedList" and (p2.markerStartNumber or 1) or nil
	end,
	["bulletPrefix"] = function(p3) -- name: bulletPrefix
		local v4
		if p3.kind == "BulletList" then
			v4 = p3.marker
		else
			v4 = nil
		end
		return v4 == "*" and "* " or "- "
	end,
	["orderedPrefix"] = function(p5) -- name: orderedPrefix
		return tostring(p5)
	end
}