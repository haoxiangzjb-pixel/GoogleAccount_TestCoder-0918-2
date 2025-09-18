// PlayerInputHandler.cpp
// A C++ class for handling player input in Unreal Engine

#include "PlayerInputHandler.h"
#include <iostream>
#include <unordered_map>
#include <functional>

// Constructor
PlayerInputHandler::PlayerInputHandler() {
    // Initialize default bindings
    SetupDefaultBindings();
}

// Destructor
PlayerInputHandler::~PlayerInputHandler() {
    inputBindings.clear();
}

// Set up default input bindings
void PlayerInputHandler::SetupDefaultBindings() {
    BindAction("Jump", [this]() { this->HandleJump(); });
    BindAction("Crouch", [this]() { this->HandleCrouch(); });
    BindAction("Fire", [this]() { this->HandleFire(); });
}

// Bind an action name to a callback function
void PlayerInputHandler::BindAction(const std::string& actionName, std::function<void()> callback) {
    inputBindings[actionName] = callback;
}

// Process input based on action name
void PlayerInputHandler::ProcessInput(const std::string& actionName) {
    auto it = inputBindings.find(actionName);
    if (it != inputBindings.end()) {
        // Execute the callback function
        it->second();
    } else {
        std::cout << "Unbound action: " << actionName << std::endl;
    }
}

// Handle jump action
void PlayerInputHandler::HandleJump() {
    std::cout << "Player is jumping!" << std::endl;
    // In a real Unreal Engine implementation, this would interact with the player character
    // For example: GetCharacter()->Jump();
}

// Handle crouch action
void PlayerInputHandler::HandleCrouch() {
    std::cout << "Player is crouching!" << std::endl;
    // In a real Unreal Engine implementation, this would interact with the player character
    // For example: GetCharacter()->Crouch();
}

// Handle fire action
void PlayerInputHandler::HandleFire() {
    std::cout << "Player is firing!" << std::endl;
    // In a real Unreal Engine implementation, this would trigger weapon firing logic
    // For example: GetCurrentWeapon()->Fire();
}