// PlayerInputHandler.cpp
// A C++ class for handling player input in Unreal Engine

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "GameFramework/Pawn.h"
#include "PlayerInputHandler.h"

// Constructor
APlayerInputHandler::APlayerInputHandler()
{
    // Set this actor to call Tick() every frame. You can turn this off to improve performance if you don't need it.
    PrimaryActorTick.bCanEverTick = true;
}

// Called when the game starts or when spawned
void APlayerInputHandler::BeginPlay()
{
    Super::BeginPlay();
    
    // Bind input actions
    SetupPlayerInputComponent();
}

// Called every frame
void APlayerInputHandler::Tick(float DeltaTime)
{
    Super::Tick(DeltaTime);
}

// Setup input bindings
void APlayerInputHandler::SetupPlayerInputComponent()
{
    // This would typically be in a PlayerController class
    // For demonstration, we're showing how input would be handled
    
    // Example input bindings:
    // InputComponent->BindAction("Jump", IE_Pressed, this, &APlayerInputHandler::Jump);
    // InputComponent->BindAxis("MoveForward", this, &APlayerInputHandler::MoveForward);
    // InputComponent->BindAxis("Turn", this, &APlayerInputHandler::Turn);
}

// Example input functions
void APlayerInputHandler::Jump()
{
    // Handle jump input
    UE_LOG(LogTemp, Warning, TEXT("Player Jumped!"));
}

void APlayerInputHandler::MoveForward(float Value)
{
    // Handle forward/backward movement
    if (Value != 0.0f)
    {
        // Get the pawn's rotation
        FRotator Rotation = GetActorRotation();
        // Get forward vector
        FVector Direction = FRotationMatrix(Rotation).GetScaledAxis(EAxis::X);
        // Add movement in that direction
        AddMovementInput(Direction, Value);
    }
}

void APlayerInputHandler::Turn(float Rate)
{
    // Handle turning input
    AddControllerYawInput(Rate * BaseTurnRate * GetWorld()->GetDeltaSeconds());
}