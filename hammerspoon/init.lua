
-- A global variable for the Hyper Mode
k = hs.hotkey.modal.new({}, "F17")

hotkeys = {
	{ '1' },
	{ 'M' },
	{ 'R' },
	{ 'W' },
	{ 'Q' },
	{ 'O' },
	{ 'I' },
	{ 'S' },
	{ 'C' },
	{ 'E' },
	{ 'T' },
	{ 'X' }
}

for i, hotkey in ipairs(hotkeys) do
	k:bind({}, hotkey[1], nil, function() hs.eventtap.keyStroke({"cmd","alt","shift","ctrl"}, 'm') end)
end

-- Enter Hyper Mode when F18 (Hyper/Capslock) is pressed
pressedF18 = function()
  k.triggered = false
  k:enter()
end

-- Leave Hyper Mode when F18 (Hyper/Capslock) is pressed,
--   send ESCAPE if no other keys are pressed.
releasedF18 = function()
  k:exit()
  if not k.triggered then
    hs.eventtap.keyStroke({}, 'ESCAPE')
  end
end

-- Bind the Hyper key
f18 = hs.hotkey.bind({}, 'F18', pressedF18, releasedF18)
