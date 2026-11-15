-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.getTestIdTag
return function(p1, p2) -- name: getTestIdTag
	if p1 == nil then
		return nil
	elseif p2 then
		return ("data-testid=%*--%*"):format(p1, p2)
	else
		return ("data-testid=%*"):format(p1)
	end
end