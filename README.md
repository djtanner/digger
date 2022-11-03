# digger

Mochi the Digger is a top-down game written in Lua and run on Love2D inspired by the DOS PC game Digger from 1983. The game was created by partially reusing features and functionality from GD50 games Zelda, Mario, and Dreadhalls, as well as implementing additional complexity in the gameplay mechanics and procedural level generation. To play the game, the player controls Mochi and must consume all of the fruits in each level while avoiding slimes and an evil cat that can only walk on dirt tiles and tries to chase Mochi. The player can score indefinitely, as levels are procedurally generated. The following is a walkthrough of the implementation.

**State Machine**
The game utilizes 3 main states : start, play, and gameover. The Start state is a title screen from which the game is launched, Play State is
where the game is played, and Game Over occurs once the player collides with any enemy (slimes or the cat).

**Level Maker**
Levels in the game are procedurally generated by laying down grass tiles, and then dirt paths are created using the same algorithm (converted 
from C# to Lua) that was used in Dreadhalls for creating the walls/maze. Fruit objects are spawned in each level, using logic based on the level number to select which pairs of fruit should appear. For example, levels that are divisible by 5 always spawn apples and bananas. This creates more complexity and cohesiveness in the gameplay rather than just randomly adding any fruit to all levels, and is also distinct from other games
implemented in the course.

**Entities**
The game consists of the player entity and the enemy entities, which are various colors of slimes and an evil cat sprite. The Util.lua file for 
quad generation was reused from the GD50 course and quads are defined in the Dependencies file. Entity attributes are defined in the entity_defs.lua file, including all of the required frames for top-down animations, such as walking in all directions or remaining idle. For
each level, enemy entities are spawned in the PlayState function spawnEnemies, where the level is passed in as a parameter, and the number of enemies increases based on the level, creating additional complexity and challenge for the player. Similar to how fruit objects are spawned, enemy slimes are also organized by color and different variations occur based on the level number, which is also distinct from other games implemented in GD50.

**Entity Walk State**
The most complex logic for the game is in the Entity Walk State used for the cat. The cat can only walk on dirt tiles, so this logic had to be defined and is used in the processAI function. This mechanism is also distinct from any of the other games implemented in GD50. Logic was written to handle when the cat is walking around the perimeter of the level and hits a corner, as well as adding some randomness to the direction of the cat during the gameplay, and lastly, adding functionality for the cat to "chase" Mochi when it is within 5 tiles, but still limited to only chasing on dirt tiles.

**Slime Walk State**
A separate walk state was implemented for the slimes, as they are not limited to only dirt tiles and roam freely around the level, in order to 
create additional challenge for the player. This code was reused from Zelda (Legend of 50) for how monsters roam in each room in the dungeon.

**Game Over State**
A table for keeping track of all the fruit Mochi consumes throughout the game is created and attached to the Player entity, so that it persists
throughout the game. When Mochi collides with an enemy, the game is over and the user is taken to the Game Over screen, where the number of each
fruit consumed during the game is displayed. This tracking of game statistics and way of displaying them to the user is distinct from other games implemented in GD50.

