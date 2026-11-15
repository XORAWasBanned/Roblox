-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Thunks.OpenValidationErrorModal
-- https://lua.expert

local OpenValidationErrorModal = require(script.Parent.Parent.Actions.OpenValidationErrorModal)

return function(p1) -- line: 5
    -- upvalues: OpenValidationErrorModal (copy)
    p1:dispatch(OpenValidationErrorModal())
end
