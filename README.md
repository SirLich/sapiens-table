# Sapiens Table mod

This is a test mod, which simply adds a table  to the game. The main purpose is to test the viability of adding buildables into Sapiens, and also finding any places where lack of exposure prevents me from doing it as a pure mode (without source code edits).


## Issues

 - No Build UI preview image
 - Model placeholder is showing even though the model is already built
 - Materials are totally wrong
 - Model preview isn't setup correctly yet (wrong positions)
 - Not tested yet whether sapiens can actually build it
 - Currently using thatch building instead of wood building

## Source Edit Issues

Two issues. Might be able to 

### buildUI.lua

84: `        constructable.types.aspenTable.index,`


### modelPlaceholder.lua

1070: 

```lua
addModel("aspenTable", {
    {
        multiKeyBase = "splitLog",
        multiCount = 5,
        additionalIndexCount = 1,
        defaultModelName = "birchSplitLog075",
        resourceTypeIndex = resource.types.splitLog.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, doorFrameSplitLogRemaps[objectTypeIndex], placeholderContext)
        end
    },
    { 
        multiKeyBase = "log",
        multiCount = 2, 
        defaultModelName = "birchLog",
        resourceTypeIndex = resource.types.log.index,
    },
    {
        key = "splitLog_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "log_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})
```