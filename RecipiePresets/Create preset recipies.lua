local function main()
	Cmd('ClearAll')

	-- Prompt for user input
	local groupNumber = TextInput('Input group number')
	local poolNumber = tonumber(TextInput('Input pool number'))
	local poolItemStart = tonumber(TextInput('Input pool item number start'))
	local poolItemEnd = tonumber(TextInput('Input pool item number end'))
	local poolItemStoreLocation = tonumber(TextInput('Input item number to store at'))

	-- fetch group name for selected gorup
	local groupname = DataPool().Groups[tonumber(groupNumber)].Name
	Cmd('Store Preset ' .. poolNumber .. '.' .. poolItemStoreLocation .. ' ' .. groupname .. ' /o')
	poolItemStoreLocation = poolItemStoreLocation + 1

	-- For all presets to store as recipies
	while poolItemStart <= poolItemEnd do
		local presetstore = poolNumber .. '.' .. poolItemStoreLocation
		local presetToAssign = poolNumber .. '.' .. poolItemStart

		Cmd('Store Preset ' .. presetstore .. '/o')
		Cmd('Assign Preset ' .. presetToAssign .. ' at Preset ' .. presetstore .. '.1')
		Cmd('Assign Group ' .. groupNumber .. ' at Preset ' .. presetstore .. '.1')

		poolItemStart = poolItemStart + 1
		poolItemStoreLocation = poolItemStoreLocation + 1
	end

end

return main