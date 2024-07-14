# RecipiePresets
[<-- back](../README.md)

----
## What it does
Creates recipie presets for a specified group, and a range of presets within a specific pool (position, color, dimmer etc.).

The plugin prompts for the following inputs:
- groupnumber
- poolnumber (the prest pool to use eg: postion is number 2)
- pool item number to start from
- pool item number to end at
- pool item number to start storing the recipie preset(s) at

Then the presets fetches the name of the group specified, and creates an empty preset at the first store location and labels it the same as the group. Thereafther it loops through every preset specified (start and stop) and creates recipie presets refrencing these presets and the provided group.

## Why
This plugin was made to easier handle updating presets, and creating a "busking" show faster.
By only having to update a defined set of presets, and then using recipie presets with the action "toggle" it is easy to "recreate" a simular functionality as with "Fast call" from MA2