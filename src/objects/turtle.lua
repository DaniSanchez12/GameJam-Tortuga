
-- Engine
local AnimatedActor = AnimatedActor or require "src/engine/AnimatedActor"

-- Objects
Camera = Camera or require "src/objects/camera"

-- Locals
local w, h = love.graphics.getDimensions()

-- Class
local Turtle = AnimatedActor:extend()
-------------------------------------

function Turtle:new(x, y, texture, speed, rotation, animations, frames, framerate)
  Turtle.super.new(self, x, y, texture, speed, rotation, animations, frames, framerate)
  -------------------------------------------------------------------------------------
  
  self.left = false
  self.right = false
  self.up = false
  self.down = false
  
  self.z = 0
  self.w = (self.width / 1000) * 2
  self.screen = {x = 0, y = 0, w = 0, h = 0}
  
  self.screen.w = self.width
  self.screen.h = self.height
  
  self.position.x = w / 2
  self.position.y = h - self.screen.h / 2
  
  self.segmentLength = 100
  
  self.maxSpeed = (self.segmentLength) / (1/60)
  
  self.speed = self.maxSpeed
  
end

function Turtle:update(dt)
  Turtle.super.update(self, dt)
  -----------------------------
  self.z = self.z + (self.speed * dt)
end

function Turtle:draw()
  Turtle.super.draw(self)
  -----------------------
end

function Turtle:reload()
  Turtle.super.reload(self)
  -------------------------
  self.speed = self.maxSpeed
  self.position.x = w / 2
  self.position.y = h - (self.screen.h / 1.75)
  
  self.z = 0
  self.w = (self.width / 1000) * 2
  self.screen = {x = 0, y = 0, w = 0, h = 0}
  
  self.screen.w = self.width
  self.screen.h = self.height
  
  
end

function Turtle:keyPressed(key)
  Turtle.super.keyPressed(self, key)
  ----------------------------------
  if (key == "a") then self.left = true end
  if (key == "d") then self.right = true end
  if (key == "w") then self.up = true end
  if (key == "s") then self.down = true end
end

function Turtle:keyReleased(key)
  Turtle.super.keyReleased(self, key)
  ----------------------------------
  if (key == "a") then self.left = false end
  if (key == "d") then self.right = false end
  if (key == "w") then self.up = false end
  if (key == "s") then self.down = false end
end

return Turtle