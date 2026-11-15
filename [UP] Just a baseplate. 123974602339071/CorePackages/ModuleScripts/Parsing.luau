-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.util.Parsing
return {
	["CODE_BLOCK_INDENT"] = 4,
	["columnsToNextTabStop"] = function(p1) -- name: columnsToNextTabStop
		return 4 - p1 % 4
	end
}