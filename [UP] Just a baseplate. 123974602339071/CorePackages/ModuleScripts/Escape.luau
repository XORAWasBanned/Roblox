-- Path: CorePackages.Packages._Index.MarkdownCore.MarkdownCore.Utils.Escape
return {
	["escapeRichFormatting"] = function(p1) -- name: escapeRichFormatting
		return p1:gsub("[&<>\"\']", {
			["&"] = "&amp;",
			["<"] = "&lt;",
			[">"] = "&gt;",
			["\""] = "&quot;",
			["\'"] = "&apos;"
		}):gsub("&amp;%l+;", {
			["&amp;lt;"] = "&lt;",
			["&amp;gt;"] = "&gt;",
			["&amp;quot;"] = "&quot;",
			["&amp;apos;"] = "&apos;",
			["&amp;amp;"] = "&amp;"
		})
	end,
	["unescapeRichFormatting"] = function(p2) -- name: unescapeRichFormatting
		return p2:gsub("&%l+;", {
			["&lt;"] = "<",
			["&gt;"] = ">",
			["&quot;"] = "\"",
			["&apos;"] = "\'",
			["&amp;"] = "&"
		})
	end
}