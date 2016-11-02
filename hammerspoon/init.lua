
-- A global variable for the Hyper Mode
k = hs.hotkey.modal.new({}, "F17")

-- These are the hotkeys that are mapped to the Hyper key. These have a corresponding binding to Hyper + [hotkey] in Keyboard maestro.
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

-- Bind each Hotkey to hyper when capslock and the hotkey is pressed.
for i, hotkey in ipairs(hotkeys) do
	pressedKey = function()
		hs.eventtap.keyStroke({"cmd","alt","shift","ctrl"}, hotkey[1])
		k.triggered = true
	end
	k:bind({}, hotkey[1], nil, pressedKey)
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
