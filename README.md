# Circuit Connectable Pipes

This Factorio 2.1 mod adds the base game's default circuit network connector to every `pipe` and `pipe-to-ground` prototype that does not already define one.

The mod runs during `data-final-fixes.lua` so it also sees pipe prototypes added by most other mods.

Existing values are preserved independently:

- An existing `circuit_connector` is never replaced.
- An existing `circuit_wire_max_distance` is never replaced.
- Only a missing property is filled with the corresponding base-game default.
