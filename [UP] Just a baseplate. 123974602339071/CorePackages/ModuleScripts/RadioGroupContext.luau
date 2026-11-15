-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.RadioGroup.RadioGroupContext
local v1 = script:FindFirstAncestor("Foundation").Parent
return require(v1.React).createContext({
	["value"] = nil,
	["onValueChanged"] = nil,
	["Selectable"] = true,
	["testId"] = "",
	["onValueChanged"] = function(_) -- name: onValueChanged
		warn("No RadioGroupProvider found for RadioGroup")
	end
})