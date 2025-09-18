// PlayerInputHandler.h
// Header file for the PlayerInputHandler class

#ifndef PLAYER_INPUT_HANDLER_H
#define PLAYER_INPUT_HANDLER_H

#include <string>
#include <unordered_map>
#include <functional>

class PlayerInputHandler {
private:
    // Map to store action bindings
    std::unordered_map<std::string, std::function<void()>> inputBindings;

    // Set up default bindings
    void SetupDefaultBindings();

    // Action handlers
    void HandleJump();
    void HandleCrouch();
    void HandleFire();

public:
    // Constructor
    PlayerInputHandler();

    // Destructor
    ~PlayerInputHandler();

    // Bind an action to a callback function
    void BindAction(const std::string& actionName, std::function<void()> callback);

    // Process input based on action name
    void ProcessInput(const std::string& actionName);
};

#endif // PLAYER_INPUT_HANDLER_H