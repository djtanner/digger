LevelMaker = Class{}

function LevelMaker.generate()

   local x = 1
   local y = 1
 
 
 
     local tiles = {}
 
     for tileY = 1, 24 do
         
         -- empty table that will serve as a new row
         table.insert(tiles, {})
 
         for tileX = 1, 24 do
            
                 table.insert(tiles[tileY], Tile(tileX, tileY, math.random(2)))
                 
          
             
         end
     end

     return GameLevel(tiles)
    
    
    end
