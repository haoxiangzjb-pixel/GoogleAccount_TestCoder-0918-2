// PlayerInputHandler.h
// Header file for the PlayerInputHandler class

#ifndef PLAYER_INPUT_HANDLER_H
#define PLAYER_INPUT_HANDLER_H

#include <string>

// Enum for input events
enum InputEvent {
    IE_Pressed,
    IE_Released
};

class PlayerInputHandler {
public:
    // Constructor and Destructor
    PlayerInputHandler();
    ~PlayerInputHandler();

    // Public methods
    void SetupInputBindings();
    void HandleInput(const std::string& actionName, InputEvent inputEvent);

private:
    // Private methods
    void BindAction(const std::string& actionName, InputEvent inputEvent, const std::string& key);
    void MoveForward();
    void MoveRight();
    void Jump();
};

#endif // PLAYER_INPUT_HANDLER_H