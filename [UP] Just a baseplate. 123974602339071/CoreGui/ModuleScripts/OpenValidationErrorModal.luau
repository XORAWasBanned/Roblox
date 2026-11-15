-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Actions.OpenValidationErrorModal
-- https://lua.expert

local CorePackages = game:GetService("CorePackages")

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(p1) -- line: 5
    return {
        errorMessage = p1
    }
end)
