-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.escapeRichText.escapeRichText
return function(p1) -- name: escapeRichText
	return p1:gsub("[&<>\"\']", {
		["&"] = "&amp;",
		["<"] = "&lt;",
		[">"] = "&gt;",
		["\""] = "&quot;",
		["\'"] = "&apos;"
	})
end