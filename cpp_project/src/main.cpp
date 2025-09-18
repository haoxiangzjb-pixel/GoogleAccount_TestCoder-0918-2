#include <iostream>
#include "utils.h"
#include "PlayerInputHandler.h"

int main() {
    std::cout << "Hello from main!" << std::endl;
    utils::print_message("This is a utility function call");
    
    // Demonstrate the PlayerInputHandler
    PlayerInputHandler inputHandler;
    
    // Process some sample inputs
    inputHandler.ProcessInput("Jump");
    inputHandler.ProcessInput("Crouch");
    inputHandler.ProcessInput("Fire");
    inputHandler.ProcessInput("UnknownAction");
    
    return 0;
}