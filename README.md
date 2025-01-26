This mod extends the early game of Space Age by putting you on the moon "Lignumis" before you escape to Nauvis. It concentrates on wood and steam technologies, giving you some early game production chains for those resources.

The duration of the stay on Lignumis will be rather short. The impact of the later game will still be substantial (once implemented).

## Beta version

This is an early version of the mod. It contains all the content that was originally planned but still needs some balancing and polishing.

**Please help me finish this mod by giving me feedback of any kind (e.g. odd, missing or broken things, ideas to improve mechanics or progression or anything else that comes to your mind).**

If you like to contribute in any other way, feel free to contact me as well.

## Mod recommendations

The following mods can be a great addition for this mod:

#### [Burner Leech Fork](https://mods.factorio.com/mod/Burner-Leech-Fork)

There will be fewer inserters that need to be fueled manually.

#### [Hot metals](https://mods.factorio.com/mod/hot-metals)

If you like the idea that metals need to cool down after being smolten in a furnace, Lignumis gold has support for hot metals.

*Note that you'll have to insert gold plates manually into the provisional rocket silo when Hot metals is active (See https://forums.factorio.com/viewtopic.php?f=48&t=123081).*

#### [Wooden Military](https://mods.factorio.com/mod/wood-military)

If you want more of it than Lignumis offers, add this mod. It adds ammo for shotguns and there are settings for rockets and artillery shells.

#### [Wooden Industry](https://mods.factorio.com/mod/wood-industry)

If you like go more into the charcoal direction. It has no overlap with Lignumis and starts to get relevant on Nauvis.

#### [Fulgora: Coralmium Agriculture](https://mods.factorio.com/mod/fulgora-coralmium-agriculture) and [Wooden Vulcanus: Sulfuric Bacteria](https://mods.factorio.com/mod/vulcanus-sulfuric-bacteria)

For wood on the other planets.

## Compatibility with other planet mods

The following planet mods are tested for (at least technical) compatibility:

- [Cerys](https://mods.factorio.com/mod/Cerys-Moon-of-Fulgora)
- [Corrundum](https://mods.factorio.com/mod/corrundum)
- [Janus](https://mods.factorio.com/mod/janus)
- [Maraxsis](https://mods.factorio.com/mod/maraxsis)
- [Muluna](https://mods.factorio.com/mod/planet-muluna)
- [Terra Palus](https://mods.factorio.com/mod/terrapalus)
- [Secretas & Frozeta](https://mods.factorio.com/mod/secretas)

## Add compatibility to your mod

Lignumis, by default, adds wood and steam science packs during `data-updates.lua` to all technologies that match certain criteria.
First it looks at a whitelist of science packs. If a technology has any of those, it is considered a candidate for adding the science packs.
Then a blacklist for science packs and specific technology names is applied.

Also, Lignumis adds wood and steam science packs during `data-updates.lua` to all labs' inputs. If your lab is special use the `lab_blacklist` described below.

These lists are made available in `data.lua` in a global table called `Lignumis` to add compatibility for other mods.

#### `science_pack_whitelist`

A technology having any of these science packs as ingredient will get wood and steam science packs added.

As wood science packs can't be imported before coming back to Lignumis, only advanced Nauvis science packs are added here and exceptions are needed for advanced technologies that are required to upgrade Lignumis to export science packs.

#### `science_pack_blacklist`

A technology is skipped if it has any of these as ingredient.

If you have a planet that only uses its own science packs and must not rely on other science packs to be imported, add your science packs to the blacklist.

#### `science_blacklist`

These technologies are skipped even if they are matches according to above lists.

Use this list if you want to have wood and steam science packs added to most of your technologies, but skip some.
Lignumis uses this list for technologies that match the whitelist but are required for coming back to Lignumis in order to create the science pack export.

#### `lab_blacklist`

Don't touch inputs for labs in this list.

Lignumis adds wood and steam science packs to all labs' inputs in `data-updates.lua` so modded labs will support them.
If your modded lab is special and it should not support these science packs, use this list or set the inputs in `data-final-fixes.lua`.

## Todo

Sorted by priority

- Fix pipe graphics on desiccation furnace and quality assembler
- Ban huge rocks with coal from Nauvis
- Create proper experience for the transition to Nauvis with a custom UI with launch button (and don't allow taking your
  inventory)
- Add more description strings
- Tweak all custom graphics colors
- Optimize images
- Compatibility with [Alien biomes](https://mods.factorio.com/mod/alien-biomes)
- Compatibility with [Amator Phasma's Coal & Steam (forked)](https://mods.factorio.com/mod/apm_power_ldinc)
- Compatibility with [Noble Metals](https://mods.factorio.com/mod/bzgold) once it's updated
- Revisit compatibility with [AAI Industry](https://mods.factorio.com/mod/aai-industry)
- Move pollution surface property to separate mod
- Trees must not die when absorbing noise
    - https://lua-api.factorio.com/latest/types/TreeVariation.html

## Credits

### Translations

- zh-CN: cyx2015s

### Assets

[Hurricane](https://mods.factorio.com/user/Hurricane046)

- Lumber mill
- Deep miner
- Quality assembler

[malcolmriley](https://github.com/malcolmriley/unused-renders)

- Gold seed
- Moist stromatolite remnant

[PreLeyZero](https://mods.factorio.com/mod/exotic-industries)

- Gold patch

[planetfall](https://mods.factorio.com/mod/ThemTharHills)

- Gold ore
- Gold wire

[CG-Matt](https://mods.factorio.com/mod/simple-wood-liquefaction)

- Wood liquefaction

[daydev](https://mods.factorio.com/mod/EquipmentPlusPortableEngine)

- Portable engine

[Zithorian's Extra Storage Tanks](https://mods.factorio.com/mod/zithorian-extra-storage-tanks)

- Gold storage tank

[Wooden Basegame Assets](https://mods.factorio.com/mod/wood-base-assets)

- Lumber

[Krastorio 2 Assets](https://mods.factorio.com/mod/Krastorio2Assets)

- Basic radar

[Icons8](https://icons8.com)

- [Mute icon](https://icons8.com/icon/9414/no-audio)