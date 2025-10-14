// Copyright [Year] [Your Name]. All Rights Reserved.

#include "MyPlayerController.h"
#include "Engine/Engine.h"

void AMyPlayerController::SetupInputComponent()
{
    Super::SetupInputComponent();

    // Bind input axis
    InputComponent->BindAxis("MoveForward", this, &AMyPlayerController::MoveForward);
    InputComponent->BindAxis("MoveRight", this, &AMyPlayerController::MoveRight);

    // Bind input action
    InputComponent->BindAction("Jump", IE_Pressed, this, &AMyPlayerController::Jump);
}

void AMyPlayerController::MoveForward(float Value)
{
    if (Value != 0.0f)
    {
        // Add forward movement logic here
        if (GEngine) GEngine->AddOnScreenDebugMessage(-1, 1.5, FColor::Green, FString::Printf(TEXT("Moving Forward: %f"), Value));
    }
}

void AMyPlayerController::MoveRight(float Value)
{
    if (Value != 0.0f)
    {
        // Add right movement logic here
        if (GEngine) GEngine->AddOnScreenDebugMessage(-1, 1.5, FColor::Green, FString::Printf(TEXT("Moving Right: %f"), Value));
    }
}

void AMyPlayerController::Jump()
{
    // Add jump logic here
    if (GEngine) GEngine->AddOnScreenDebugMessage(-1, 1.5, FColor::Blue, TEXT("Jump!"));
}