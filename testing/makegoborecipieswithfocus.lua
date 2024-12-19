local function main()
	Cmd('ClearAll')

	-- Prompt for user input
	local groupNumber = TextInput('Input group number')
	local poolItemStart = tonumber(TextInput('Input pool item number start'))
	local poolItemEnd = tonumber(TextInput('Input pool item number end'))
	local poolItemStoreLocation = tonumber(TextInput('Input item number to store at'))
	local gobofocus = tonumber(TextInput('input focus preset for gobo'))

	-- Predefined variables
	local poolNumberStore = 3
	local poolNumber = 3
	local gobofocuspreset = '6.' .. gobofocus

	-- fetch group name for selected gorup
	local groupname = DataPool().Groups[tonumber(groupNumber)].Name
	Cmd('Store Preset ' .. poolNumberStore .. '.' .. poolItemStoreLocation .. ' ' .. groupname .. ' /o')
	poolItemStoreLocation = poolItemStoreLocation + 1

	-- For all presets to store as recipies
	while poolItemStart <= poolItemEnd do
		local presetstore = poolNumberStore .. '.' .. poolItemStoreLocation
		local presetToAssign = poolNumber .. '.' .. poolItemStart

		Cmd('Store Preset ' .. presetstore .. '/o')
		Cmd('Assign Preset ' .. presetToAssign .. ' at Preset ' .. presetstore .. '.1')
		Cmd('Assign Preset ' .. gobofocuspreset .. ' at Preset ' .. presetstore .. '.2')

		Cmd('Assign Group ' .. groupNumber .. ' at Preset ' .. presetstore .. '.*')

		poolItemStart = poolItemStart + 1
		poolItemStoreLocation = poolItemStoreLocation + 1
	end

end

return main