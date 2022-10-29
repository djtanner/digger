--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

PlayerWalkState = Class{__includes = EntityWalkState}

function PlayerWalkState:init(player, level)
    self.entity = player
    self.level = level
    

    -- render offset for spaced character sprite; negated in render function of state
    self.entity.offsetY = 0
    self.entity.offsetX = 0
end

function PlayerWalkState:update(dt)
    if love.keyboard.isDown('left') then
        self.entity.direction = 'left'
        self.entity:changeAnimation('walk-left')
    elseif love.keyboard.isDown('right') then
        self.entity.direction = 'right'
        self.entity:changeAnimation('walk-right')
    elseif love.keyboard.isDown('up') then
        self.entity.direction = 'up'
        self.entity:changeAnimation('walk-up')
    elseif love.keyboard.isDown('down') then
        self.entity.direction = 'down'
        self.entity:changeAnimation('walk-down')
    else
        self.entity:changeState('idle')
    end



    -- perform base collision detection against walls
    EntityWalkState.update(self, dt)

    -- if walking on a grass tile, change it to dirt
    for k,tile in pairs(self.level.tiles) do
        local checkTileX = math.floor(self.entity.x / TILE_SIZE + 2)
        local checkTileY = math.floor(self.entity.y / TILE_SIZE + 2)


        print("tileX", checkTileX)
        print("tileY", checkTileY)
        print("color", self.level.tiles[checkTileY][checkTileX].color)
        
        

        if(self.level.tiles[checkTileY][checkTileX].color == 2) then
            self.level.tiles[checkTileY][checkTileX].color = 1
        end




    end




        -- check if we've collided with any collidable gameobjects (pots)
        --[[ for k,object in pairs(self.dungeon.currentRoom.objects) do
            if self.entity:collides(object) then
                if object.solid then
                      --  print('objectx', object.x)
                      --  print('selfx', self.entity.x)
                      --  print('objecty', object.y)
                      --  print('selfy', math.floor(self.entity.y+0.5))
                      --  print((object.y  >= math.floor(self.entity.y +self.entity.height + .5)) )

                    -- walking left and object has to be left of me and not fully above or fully below
                    if self.entity.direction == 'left' 
                    and (object.x  <= math.floor(self.entity.x + object.width+0.5 )) 
                    and ((self.entity.y + self.entity.height > object.y and self.entity.y + self.entity.height < object.y +object.height) or (
                        self.entity.y < object.y + object.height and self.entity.y > object.y
                     ))
                     then


                       self.entity.x = object.x  + object.width
                       --print('walking left')

                      

                        -- walking right and object has to be right of me and not fully above or fully below
                    elseif self.entity.direction == 'right' 
                    and (object.x >= math.floor(self.entity.x  + 0.5 )) 
                    and ( (self.entity.y + self.entity.height > object.y and self.entity.y + self.entity.height < object.y +object.height) or (
                        self.entity.y < object.y + object.height and self.entity.y > object.y
                     ))
                    
                    then
                        self.entity.x =object.x - self.entity.width 
                        --print('walking right')
                       


                    --walking up and object must be above me and not fully right or left    
                    elseif self.entity.direction == 'up'
                    and (object.y  <= math.floor(self.entity.y + .5)) 
                    and ( (self.entity.x + self.entity.width > object.x and self.entity.x + self.entity.width <object.x +object.width) or (
                        self.entity.x < object.x + object.width and self.entity.x > object.x))
                    then
                        self.entity.y = object.y + object.height/3
                        --print('walking up')
                    
                        --walking down and object must be below me and not fully right or left
                    elseif self.entity.direction == 'down' 
                    and (object.y  >= math.floor(self.entity.y +self.entity.height/2 + .5)) 
                    and ((self.entity.x + self.entity.width > object.x and self.entity.x + self.entity.width < object.x +object.width) or (
                        self.entity.x < object.x + object.width and self.entity.x > object.x))
                    
                    then
                        self.entity.y = object.y - self.entity.height
                        --print('walking down')
                        
                    end
                end
            end
            
        end ]]

    -- if we bumped something when checking collision, check any object collisions
    --[[ if self.bumped then
        if self.entity.direction == 'left' then
            
            -- temporarily adjust position into the wall, since bumping pushes outward
            self.entity.x = self.entity.x - PLAYER_WALK_SPEED * dt
            
            -- check for colliding into doorway to transition
            for k, doorway in pairs(self.dungeon.currentRoom.doorways) do
                if self.entity:collides(doorway) and doorway.open then

                    -- shift entity to center of door to avoid phasing through wall
                    self.entity.y = doorway.y + 4
                    Event.dispatch('shift-left')
                end
            end

            -- readjust
            self.entity.x = self.entity.x + PLAYER_WALK_SPEED * dt
        elseif self.entity.direction == 'right' then
            
            -- temporarily adjust position
            self.entity.x = self.entity.x + PLAYER_WALK_SPEED * dt
            
            -- check for colliding into doorway to transition
            for k, doorway in pairs(self.dungeon.currentRoom.doorways) do
                if self.entity:collides(doorway) and doorway.open then

                    -- shift entity to center of door to avoid phasing through wall
                    self.entity.y = doorway.y + 4
                    Event.dispatch('shift-right')
                end
            end

            -- readjust
            self.entity.x = self.entity.x - PLAYER_WALK_SPEED * dt
        elseif self.entity.direction == 'up' then
            
            -- temporarily adjust position
            self.entity.y = self.entity.y - PLAYER_WALK_SPEED * dt
            
            -- check for colliding into doorway to transition
            for k, doorway in pairs(self.dungeon.currentRoom.doorways) do
                if self.entity:collides(doorway) and doorway.open then

                    -- shift entity to center of door to avoid phasing through wall
                    self.entity.x = doorway.x + 8
                    Event.dispatch('shift-up')
                end
            end

            -- readjust
            self.entity.y = self.entity.y + PLAYER_WALK_SPEED * dt
        else
            
            -- temporarily adjust position
            self.entity.y = self.entity.y + PLAYER_WALK_SPEED * dt
            
            -- check for colliding into doorway to transition
            for k, doorway in pairs(self.dungeon.currentRoom.doorways) do
                if self.entity:collides(doorway) and doorway.open then

                    -- shift entity to center of door to avoid phasing through wall
                    self.entity.x = doorway.x + 8
                    Event.dispatch('shift-down')
                end
            end

            -- readjust
            self.entity.y = self.entity.y - PLAYER_WALK_SPEED * dt
        end
    end ]]
end