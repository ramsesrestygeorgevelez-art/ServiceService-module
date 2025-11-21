local DataStoreService = game:GetService("DataStoreService")
local MetaLoad = {}
 
function MetaLoad:AddMeta(meta)
   local metaData =  DataStoreService:GetDataStore("MetaData")
   metaData:GetAsync(meta)
end
return MetaLoad