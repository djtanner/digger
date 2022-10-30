--[[Code reused from:
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

EntityWalkState = Class{__includes = BaseState}

function EntityWalkState:init(entity, level)
    self.entity = entity
    self.entity:changeAnimation('walk-down')

    self.level = level

    -- used for AI control
    self.moveDuration = 0
    self.movementTimer = 0

    -- keeps track of whether we just hit a wall
    self.bumped = false
end

function EntityWalkState:update(dt)
    
    -- assume we didn't hit a wall
    self.bumped = false

    -- boundary checking on all sides, allowing us to avoid collision detection on tiles
    if self.entity.direction == 'left' then
        self.entity.x = self.entity.x - self.entity.walkSpeed * dt
        
        if self.entity.x <=  0  then 
            self.entity.x =  0 
            self.bumped = true
        end
    elseif self.entity.direction == 'right' then
        self.entity.x = self.entity.x + self.entity.walkSpeed * dt

        if self.entity.x  >= VIRTUAL_WIDTH - TILE_SIZE   then
            self.entity.x = VIRTUAL_WIDTH - TILE_SIZE - self.entity.width
            self.bumped = true
        end
    elseif self.entity.direction == 'up' then
        self.entity.y = self.entity.y - self.entity.walkSpeed * dt

                if self.entity.y <=  0 then 
                    self.entity.y =  0

            self.bumped = true
        end
    elseif self.entity.direction == 'down' then
        self.entity.y = self.entity.y + self.entity.walkSpeed * dt

             local bottomEdge = VIRTUAL_HEIGHT 

        if self.entity.y + self.entity.height >= bottomEdge then
            self.entity.y = bottomEdge - self.entity.height
            self.bumped = true
        end
    end


end



function EntityWalkState:processAI(params, dt)
    local level = params.level
    local directions = {'left', 'right', 'up', 'down'}

    local tileLeft = level:pointToTile(self.entity.x, self.entity.y)
    local tileDown = level:pointToTile(self.entity.x+self.entity.width, self.entity.y - 2*TILE_SIZE)
    if tileLeft then
    print(tileLeft.color)
    end

       -- only allow walking on dirt tiles
       --if self.direction == 'down' then
        if tileLeft and tileLeft.color == 1 then
            self.entity.direction = 'left'
            self.entity:changeAnimation('walk-left')
            print("changed directions to left")  
           
        elseif tileDown and tileDown.color == 1 then
        -- check the tile below
            self.entity.direction = 'down'
            self.entity:changeAnimation('walk-down')
            print("changed directions down")  
        
    end
   

    if self.moveDuration == 0 or self.bumped then
        
        -- set an initial move duration and direction
        self.moveDuration = math.random(5)
        --[[ self.entity.direction = directions[math.random(#directions)]
        self.entity:changeAnimation('walk-' .. tostring(self.entity.direction)) ]]
   
    elseif self.movementTimer > self.moveDuration then
        self.movementTimer = 0
    

        -- chance to go idle
        if math.random(3) == 1 then
            self.entity:changeState('idle')
        else
            self.moveDuration = math.random(5)
            --[[ self.entity.direction = directions[math.random(#directions)]
            self.entity:changeAnimation('walk-' .. tostring(self.entity.direction)) ]]
        end
    end

    self.movementTimer = self.movementTimer + dt

   
end

function EntityWalkState:render()
    local anim = self.entity.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.entity.x - self.entity.offsetX), math.floor(self.entity.y - self.entity.offsetY))
    
    -- debug code
    -- love.graphics.setColor(255, 0, 255, 255)
    -- love.graphics.rectangle('line', self.entity.x, self.entity.y, self.entity.width, self.entity.height)
    -- love.graphics.setColor(255, 255, 255, 255)
end