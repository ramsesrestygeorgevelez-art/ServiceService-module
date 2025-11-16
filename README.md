# ServiceService-module

-- ServiceService by RAMSES_SERVICESOWNER

-- This module creates SPECIAL services! Plus it uses DRCS. (Don't Repeat Creating Services), a principle by me.

--// ATTRIBUTES 

-- CreateActorByService: Creates an "Actor" class when true.

-- SetServiceType: Sets the type of the service. Can be loaded by MetaLoad.

# Lua Code Preview

``` lua

local SS = require(game:GetService("ReplicatedStorage"):WaitForChild("ServiceService"))
local Signal = require(game:GetService("ReplicatedStorage"):WaitForChild("Signal"))

-- // Creating Services

local Service = SS:Create("HelloService", {
    function Hello()
      print("Hello!")
    end
  },
  {
    ["Printable"} = true
  },
  {
   OnPrinted = Signal.new()
}, game.Workspace)

Service:Hello() --// prints "Hello!"

Service.OnPrinted:Connect(function()
   print("Hello! (2)")
end
```

# Docs


| Function | Parameters | Description |
|---|---|---|
| Create | Name: string, functions: Table, Properties: Table, Signals; Table, Parent: Instance | Creates a service. |
| CreateProperty | Name: string,  | Row 2, Col 3 |
