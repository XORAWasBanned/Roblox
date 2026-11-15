-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.NumberInput.calculateNumberInputValueFromPositions
return function(p1, p2, p3, p4, p5) -- name: calculateNumberInputValueFromPositions
	local v6 = (p3 - p2) * (p5 or 1)
	return p1 + math.floor(v6) * p4
end