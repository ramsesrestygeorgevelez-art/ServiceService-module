-- ServiceService by RAMSES_SERVICESOWNER

-- This module creates SPECIAL services! Plus it uses DRCS. (Don't Repeat Creating Services), a principle by me. And DRY. (Don't Repeat Yourself)

--// ATTRIBUTES 

-- CreateActorByService: Creates an "Actor" class when true.
-- SetServiceType: Sets the type of the service. Can be loaded by MetaLoad.

--// SERVICES / Modules

local ServicesModule = require(script.Parent:WaitForChild("ServiceModule"))
local MetaLoad = require(script.Parent:WaitForChild("MetaLoad"))

local ServiceService = {}

function ServiceService:Create(name, funcTable, propTable, signals, parent)
    
    local self = setmetatable({}, ServiceService)
    self.__load = MetaLoad:Load(self)
    self.name = name
    self.__funcs = funcTable
    self.parent = parent
    self.__serviceData = ServiceModule:CreateData({
        ["Name"] = self.name;
        ["Functions"] = self.__funcs;
        ["Properties"] = self.__properties;
        ["Signals"] = self.__signals
    })
    self.__properties = propTable
    self.__actorCreateService = self:CreateProperty(self.name, "IsCreatedByActor", script:GetAttribute("CreateActorByService"))
    self.__signals = signals
    
    return self
end
function ServiceService:GroupServices(tableOfServices)
    local group = Instance.new("Folder")
    local services = tableOfServices:unpack()
    
    services.parent = group
end
function ServiceService:CreateProperty(name, propertyName, value)
    if name == self.name then
        table.insert(self.__properties, [propertyName] = value)
    end
end
function ServiceService:CreateSignal(signalName)
   table.insert(self.__signals, signalName)
end
function ServiceService:GetProperty(name)
    return self.__properties[name]
end
return ServiceService













