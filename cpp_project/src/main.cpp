#include <iostream>
#include "utils.h"
#include "PlayerInputHandler.h"

int main() {
    std::cout << "Hello from main!" << std::endl;
    utils::print_message("This is a utility function call");
    
    // Demonstrate the PlayerInputHandler
    std::cout << "\n--- Player Input Handler Demo ---" << std::endl;
    PlayerInputHandler inputHandler;
    
    // Simulate some player inputs
    inputHandler.HandleInput("MoveForward", IE_Pressed);
    inputHandler.HandleInput("Jump", IE_Pressed);
    inputHandler.HandleInput("MoveRight", IE_Pressed);
    
    return 0;
}