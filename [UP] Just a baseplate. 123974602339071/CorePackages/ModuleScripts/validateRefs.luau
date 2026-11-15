-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Utils.validateRefs
return function(p1) -- name: validateRefs
	for _, v2 in p1 do
		if v2.current ~= nil then
			continue
		end
		return false
	end
	return true
end