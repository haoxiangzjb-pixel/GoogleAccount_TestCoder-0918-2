# Player Input Handler

This is a C++ class for Unreal Engine that extends the PlayerController to handle player input.

## Files

- `PlayerInputHandler.h` - Header file with class declaration
- `PlayerInputHandler.cpp` - Implementation file with input handling logic

## Features

- Movement controls (forward/backward, strafing)
- Mouse look controls (turning, looking up/down)
- Jumping controls

## Usage

To use this class in your Unreal Engine project:

1. Copy the PlayerInputHandler.h and PlayerInputHandler.cpp files to your project's Source directory
2. Add the appropriate input bindings in your project settings:
   - MoveForward (Axis)
   - MoveRight (Axis)
   - Turn (Axis)
   - LookUp (Axis)
   - Jump (Action)
3. Set the Player Controller class in your Game Mode to APlayerInputHandler