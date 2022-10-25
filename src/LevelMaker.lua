LevelMaker = Class{}

function LevelMaker.generate()

    local tiles = {}
    local objects = {}
    
    local tilesToRemove = 120;
    mazeX = 4
    mazeY = 1
 
     
 
     for tileY = 1, 24 do
         
         -- empty table that will serve as a new row
         table.insert(tiles, {})
 
            -- set entire level to grass
         for tileX = 1, 24 do
            
                 table.insert(tiles[tileY], Tile(tileX, tileY, 2))
          
         end
     end

     -- make the outside borders dirt tiles
     --left wall
     for tileX = 1, 24 do
        tiles[tileX][1].color = 1
     end

    --right wall
    for tileX = 1, 24 do
        tiles[tileX][24].color = 1
     end

    --top wall
    for tileY = 1,24 do
        tiles[1][tileY].color = 1
    end

    --bottom wall
    for tileY = 1,24 do
        tiles[14][tileY].color = 1
    end

        -- crawl through the level and make a maze with the dirt tiles
        -- maze algorithm is the same logic that was used in dreadhalls GD50

        tilesDug = 0

        while (tilesDug < tilesToRemove) do
            xDirection = 0
            yDirection = 0

        if(math.random() < 0.5) then
            xDirection = math.random() < 0.5 and 1 or -1
        else
            yDirection = math.random() < 0.5 and 1 or -1

        end

        numSpacesMove = math.random(1,23)

        for i = 1, numSpacesMove do
        mazeX = math.min(math.max(mazeX + xDirection, 1), 22)
        mazeY = math.min(math.max(mazeY + yDirection, 1), 22)            
   
            if (tiles[mazeX][mazeY].color == 2) then
                tiles[mazeX][mazeY].color = 1
                tilesDug = tilesDug + 1
            end
        end

    end

    -- Add some fruit to the level

    for i = 1, 10 do
        

        table.insert(objects, GameObject {
            animations = GAME_OBJECT_DEFS["apple"].animations,
            x = math.random(TILE_SIZE,
                VIRTUAL_WIDTH - TILE_SIZE * 2 - 16),
            y = math.random(TILE_SIZE,
                VIRTUAL_HEIGHT - (VIRTUAL_HEIGHT - 24 * TILE_SIZE) - TILE_SIZE - 16),
            
            width = 32,
            height = 32   
        })
    end



     return GameLevel(tiles, objects)
    
    
end
