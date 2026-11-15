-- Path: CorePackages.Packages._Index.Collections.Collections.Object.seal
local v1 = script.Parent.Parent.Parent
require(v1.ES7Types)
return function(p2)
	return table.freeze(p2)
end