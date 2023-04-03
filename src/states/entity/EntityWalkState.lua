EntityWalkState = Class{__includes = BaseState}

function EntityWalkState:init(entity, level, player)
    self.entity = entity
    self.entity:changeAnimation('walk-down')

    self.level = level
    self.player = player

    -- used for AI control
    self.moveDuration = 0
    self.movementTimer = 0

    -- keeps track of whether we just hit a wall
    self.bumped = false

    if (self.entity.type == 'monster') then
    self.entity.offsetY = 8
    self.entity.offsetX = 8
    end


    self.entity:changeAnimation('walk-' .. self.entity.direction)

    local map = {}
    local colorMap = self.level.tiles

    -- map is 24 x 14
    for i = 1, 14 do
        table.insert(map, {})
        for j = 1, 24 do
            table.insert(map[i], colorMap[i][j].color)
        end
    end




    -- Value for walkable tiles - dirt tiles = 1
local walkable = 1

-- Library setup
local Grid = require ("jumper.grid") -- The grid class
local Pathfinder = require ("jumper.pathfinder") -- The pathfinder class

-- Creates a grid object
local grid = Grid(map) 
-- Creates a pathfinder object using Jump Point Search
local myFinder = Pathfinder(grid, 'ASTAR', walkable)
    -- get the path to the player using the A* algorithm
    local path = myFinder:getPath(self.entity.x, self.entity.y, 12,12)

    if path then
        -- set up a queue of steps to take to reach the player
        self.steps = {}

        for i = 1, #path - 1 do
            --[[ local startX, startY = self.level:tileToPixel(path[i].x, path[i].y) ]]
            local startX, startY = 1,1
            local endX, endY = self.level:tileToPixel(path[i+1].x, path[i+1].y)

            table.insert(self.steps, {
                startX = startX,
                startY = startY,
                endX = endX,
                endY = endY,
                direction = path[i+1].direction
            })
        end

        self.entity:changeState('walk', {
            walkSpeed = ENTITY_WALK_SPEED,
            onWalkComplete = function()
                -- when we finish walking, set the entity to the idle state
                self.entity:changeState('idle', {
                    direction = self.entity.direction
                })
            end,
            steps = self.steps
        })
    else
        -- if there is no path to the player, set the entity to the idle state
        self.entity:changeState('idle', {
            direction = self.entity.direction
        })
    end


    

    
end

function EntityWalkState:update(dt)
  

    -- assume we didn't hit a wall
    self.bumped = false

    -- boundary checking on all sides, allowing us to avoid collision detection on tiles
    --[[Boundary checking code was reused from:GD50 Legend of Zelda
    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]
    if self.entity.type ~= 'monster' then 
      if self.entity.direction == 'left'  then
        self.entity.x = self.entity.x - self.entity.walkSpeed * dt
        
        if self.entity.x <=  0  then 
            self.entity.x =  0 
            self.bumped = true
        end
    elseif self.entity.direction == 'right' then
        self.entity.x = self.entity.x + self.entity.walkSpeed * dt

        if self.entity.x  >= VIRTUAL_WIDTH - TILE_SIZE   then
            self.entity.x = VIRTUAL_WIDTH - TILE_SIZE 
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

end



function EntityWalkState:processAI(params, dt)
    
    local level = params.level
    local map = {}
    local colorMap = level.tiles

    -- map is 24 x 14
    for i = 1, 14 do
        table.insert(map, {})
        for j = 1, 24 do
            table.insert(map[i], colorMap[i][j].color)
        end
    end

-- Value for walkable tiles - dirt tiles = 1
local walkable = 1

-- Library setup
local Grid = require ("jumper.grid") -- The grid class
local Pathfinder = require ("jumper.pathfinder") -- The pathfinder class

-- Creates a grid object
local grid = Grid(map) 
-- Creates a pathfinder object using Jump Point Search
local myFinder = Pathfinder(grid, 'ASTAR', walkable) 

-- Define start and goal locations coordinates
local startx, starty =24,1 --math.floor(self.entity.x/16)+1, math.floor(self.entity.y/16)+1
--[[ local endx, endy = math.floor(self.player.x/24), math.floor(self.player.y/14) ]]
local endx, endy = 12,6


-- Calculates the path, and its length
self.path = myFinder:getPath(startx, starty, endx, endy)
if self.path then
  print(('Path found! Length: %.2f'):format(self.path:getLength()))
	for node, count in self.path:nodes() do
	  print(('Step: %d - x: %d - y: %d'):format(count, node:getX(), node:getY()))

        nextX = node:getX()
        nextY = node:getY()
           self.entity.x = nextX * 16 + self.entity.walkSpeed * dt 
        self.entity.y = nextY * 16 + self.entity.walkSpeed * dt 
        
     

        
        

        print(self.entity.x)
        print(self.entity.y)

    end

	end
    


end






function EntityWalkState:render()
 


    local anim = self.entity.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.entity.x - self.entity.offsetX), math.floor(self.entity.y - self.entity.offsetY))
    
    -- debug code
    love.graphics.setColor(255, 0, 255, 255)
    love.graphics.rectangle('line', self.entity.x, self.entity.y, self.entity.width, self.entity.height)
    love.graphics.setColor(255, 255, 255, 255)  
end