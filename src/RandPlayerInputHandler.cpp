#include "MyPlayerController.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"

void AMyPlayerController::SetupInputComponent()
{
    Super::SetupInputComponent();

    // Get the EnhancedInputComponent
    UEnhancedInputComponent* PlayerInputComponent = Cast<UEnhancedInputComponent>(InputComponent);
    if (PlayerInputComponent)
    {
        // Bind the actions
        PlayerInputComponent->BindAction(MoveForwardAction, ETriggerEvent::Triggered, this, &AMyPlayerController::MoveForward);
        PlayerInputComponent->BindAction(MoveRightAction, ETriggerEvent::Triggered, this, &AMyPlayerController::MoveRight);
        PlayerInputComponent->BindAction(JumpAction, ETriggerEvent::Started, this, &AMyPlayerController::Jump);
        PlayerInputComponent->BindAction(FireAction, ETriggerEvent::Started, this, &AMyPlayerController::Fire);
    }
}

void AMyPlayerController::MoveForward(float Value)
{
    // Add forward movement logic here
}

void AMyPlayerController::MoveRight(float Value)
{
    // Add right movement logic here
}

void AMyPlayerController::Jump()
{
    // Add jump logic here
}

void AMyPlayerController::Fire()
{
    // Add fire logic here
}