-- Path: CorePackages.Packages._Index.MarkdownCore.MarkdownCore.Utils.Highlighter.Utility
return {
	["sanitizeRichText"] = function(p1) -- name: sanitizeRichText
		return string.gsub(string.gsub(string.gsub(string.gsub(string.gsub(p1, "&", "&amp;"), "<", "&lt;"), ">", "&gt;"), "\"", "&quot;"), "\'", "&apos;")
	end,
	["convertTabsToSpaces"] = function(p2) -- name: convertTabsToSpaces
		return string.gsub(p2, "\t", "    ")
	end,
	["removeControlChars"] = function(p3) -- name: removeControlChars
		return string.gsub(p3, "[\0\1\2\3\4\5\6\7\8\11\f\r\14\15\16\17\18\19\20\21\22\23\24\25\26\27\28\29\30\31]+", "")
	end
}