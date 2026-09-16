function CreateFolder(Name, Archivable, Parent)
    local Folder = Instance.new("Folder")
    Folder.Name = Name or "Folder"
    Folder.Archivable = (Archivable == nil) and true or Archivable
    Folder.Parent = Parent or game
    return Folder
end

function CloneInstance(InstanceToClone, Parent)
    local Archivable = InstanceToClone.Archivable
    InstanceToClone.Archivable = true
    local Cloned = InstanceToClone:Clone()
    Cloned.Parent = Parent
    InstanceToClone.Archivable = Archivable
end

local NilInstancesFolder = game:FindFirstChild("Nil Instances Container") or CreateFolder("Nil Instances Container", false, game)

for _, Instance in getnilinstances() do
    if Instance.ClassName == "Ugc" or Instance == game then
        continue
    end
    local ClassNameFolder = NilInstancesFolder:FindFirstChild(Instance.ClassName)
    if not ClassNameFolder then
        ClassNameFolder = CreateFolder(Instance.ClassName, true, NilInstancesFolder)
    end
    pcall(CloneInstance, Instance, ClassNameFolder)
end
