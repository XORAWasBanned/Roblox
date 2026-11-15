-- Path: CorePackages.Packages._Index.Markdown.Markdown.Utils.processSoftBreaks
return function(p1) -- name: processSoftBreaks
	return p1:gsub("%s*[\r\n]%s*", " ")
end