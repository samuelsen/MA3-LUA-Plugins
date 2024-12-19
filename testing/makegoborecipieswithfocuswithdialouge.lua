local function main()

    local gruppernummer = "01. Gruppernummer"
    local poolItemStart = "02. Pool item start"
    local poolItemEnd = "03. Pool item end"
    local poolItemStoreLocation = "04. Pool item store location"
    local focuspreset = "06. Pool item focus preset"
    local stateCreateLabel = "Create label"

    -- create inputs:
    local inputs = {
        {name = gruppernummer, value = "", whiteFilter = "0123456789"},
        {name = poolItemStart, value = "", whiteFilter = "0123456789"},
        {name = poolItemEnd, value = "", whiteFilter = "0123456789"},
        {name = poolItemStoreLocation, value = "", whiteFilter = "0123456789"},
        {name = focuspreset, value = "", whiteFilter = "0123456789"}
    }

    local states = {{name = stateCreateLabel, state = true, group = 1}}

    -- open messagebox:
    local resultTable = MessageBox({
        title = "Opprett gobo recipie presets",
        message_align_h = Enums.AlignmentH.Left,
        message_align_v = Enums.AlignmentV.Top,
        inputs = inputs,
        states = states,
        commands = {{value = 1, name = "Ok"}, {value = 0, name = "Cancel"}},
        backColor = "Global.Default",
        icon = "logo_small",
        titleTextColor = "Global.Text",
        messageTextColor = "Global.Text",
        autoCloseOnInput = false
    })
    -- print results:
    Printf("Success = " .. tostring(resultTable.success))

    if resultTable.success then

        Printf("Result = " .. resultTable.result)

        Printf("Gruppe: %s", resultTable.inputs[gruppernummer])

        -- Predefined variables
        local poolNumberStore = 3
        local poolNumber = 3
        local gobofocuspreset = '6.' .. resultTable.inputs[focuspreset]

        local storelocation = resultTable.inputs[poolItemStoreLocation]
        local itemStart = resultTable.inputs[poolItemStart]
        local itemEnd = resultTable.inputs[poolItemEnd]

        -- fetch group name for selected gorup

        if resultTable.states[stateCreateLabel] then

            local groupname = DataPool().Groups[tonumber(
                                  resultTable.inputs[gruppernummer])].Name
            Cmd('Store Preset ' .. poolNumberStore .. '.' .. storelocation ..
                    ' ' .. groupname .. ' /o')
            storelocation = storelocation + 1

        end

        -- For all presets to store as recipies
        while itemStart <= itemEnd do
            local presetstore = poolNumberStore .. '.' .. storelocation
            local presetToAssign = poolNumber .. '.' .. itemStart

            Cmd('Store Preset ' .. presetstore .. '/o')
            Cmd('Assign Preset ' .. presetToAssign .. ' at Preset ' ..
                    presetstore .. '.1')
            Cmd('Assign Preset ' .. gobofocuspreset .. ' at Preset ' ..
                    presetstore .. '.2')

            Cmd(
                'Assign Group ' .. groupNumber .. ' at Preset ' .. presetstore ..
                    '.*')

            itemStart = itemStart + 1
            storelocation = storelocation + 1
        end

        for k, v in pairs(resultTable.inputs) do
            Printf("Input '%s' = '%s'", k, v)
        end
    end
end
return main