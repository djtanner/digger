LevelMaker = Class{}

function LevelMaker.generate(levelNumber)

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
        mazeX = math.min(math.max(mazeX + xDirection, 1), 23)
        mazeY = math.min(math.max(mazeY + yDirection, 1), 23)            
   
            if (tiles[mazeX][mazeY].color == 2) then
               tiles[mazeX][mazeY].color = 1
                tilesDug = tilesDug + 1
            end
        end

    end

    -- Add some fruit to the level
   -- local types = {'apple', 'banana','cherry','melon','kiwi','pineapple','strawberry'}
    local types1 = {'apple', 'banana'}
    local types2 = {'cherry','melon'}
    local types3 = {'kiwi','pineapple'}
    local types4 = {'strawberry', 'banana'}

    local levelType

    if levelNumber == 1 or levelNumber % 5 == 0 then
         levelType = types1

    elseif levelNumber % 2 == 0 then
     levelType = types2

    elseif levelNumber % 3 == 0 then
     levelType = types3

    else levelType = types4
    end

    for i = 1, (10 + levelNumber)  do
        
        local type = levelType[math.random(#levelType)]

        local fruit =  GameObject(GAME_OBJECT_DEFS[type],
            math.random(32, VIRTUAL_WIDTH-32),
            math.random(32, 192))

        
        table.insert(objects, fruit)

       objects[i].stateMachine = StateMachine {
            ['idle'] = function() return FruitIdleState(objects[i]) end
        }
        
        objects[i]:changeState('idle')

        objects[i].onConsume = GAME_OBJECT_DEFS[type].onConsume
        


        
    end




     return GameLevel(tiles, objects)
    
    
end

