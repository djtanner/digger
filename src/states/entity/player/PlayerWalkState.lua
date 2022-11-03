PlayerWalkState = Class{__includes = EntityWalkState}

function PlayerWalkState:init(player, level)
    self.entity = player
    self.level = level
    
  self.entity.offsetY = 16
  self.entity.offsetX = 16
end

function PlayerWalkState:update(dt)
    --[[This code was reused from: Author: Colton Ogden cogden@cs50.harvard.edu]]
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


    EntityWalkState.update(self, dt)

    -- if walking on a grass tile, change it to dirt
    for k,tile in pairs(self.level.tiles) do
        local checkTileX = math.floor(self.entity.x / TILE_SIZE + 1)
        local checkTileY = math.floor(self.entity.y / TILE_SIZE + 1)


   --[[      print("tileX", checkTileX)
        print("tileY", checkTileY)
        print("color", self.level.tiles[checkTileY][checkTileX].color) ]]
        

        if(self.level.tiles[checkTileY][checkTileX].color == 2) then
            self.level.tiles[checkTileY][checkTileX].color = 1
        end

   
        -- check if we've collided with any collidable gameobjects (fruits)
        for k,object in pairs(self.level.objects) do
            if self.entity:collides(object) and object.type == "fruit" then
                
                if object.isConsumable then
                    
                    table.remove(self.level.objects,k)
                    -- increase the score
                    object.onConsume()
                end     
                    
                end
            end
            
        end 

   
end