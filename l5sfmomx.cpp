#include "PlayerInputHandler.h"

APlayerInputHandler::APlayerInputHandler()
{
// Set this pawn to call Tick() every frame
PrimaryActorTick.bCanEverTick = true;
}

void APlayerInputHandler::SetupInputComponent()
{
Super::SetupInputComponent();

if (UInputComponent* PlayerInputComponent = Cast<UInputComponent>(InputComponent))
{
// Bind action events
if (MoveForwardAction)
{
PlayerInputComponent->BindAction(MoveForwardAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::MoveForward);
}

if (MoveRightAction)
{
PlayerInputComponent->BindAction(MoveRightAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::MoveRight);
}

if (LookUpAction)
{
PlayerInputComponent->BindAction(LookUpAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::LookUp);
}

if (TurnAction)
{
PlayerInputComponent->BindAction(TurnAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::Turn);
}

if (JumpAction)
{
PlayerInputComponent->BindAction(JumpAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::Jump);
}
}
}

void APlayerInputHandler::BeginPlay()
{
Super::BeginPlay();

// Additional initialization
}

void APlayerInputHandler::MoveForward(float Value)
{
// Handle forward movement input
if (Value != 0.0f)
{
// Add movement in the forward direction
AddMovementInput(GetPawn()->GetActorForwardVector(), Value);
}
}

void APlayerInputHandler::MoveRight(float Value)
{
// Handle right movement input
if (Value != 0.0f)
{
// Add movement in the right direction
AddMovementInput(GetPawn()->GetActorRightVector(), Value);
}
}

void APlayerInputHandler::LookUp(float Value)
{
// Handle look up/down input
if (Value != 0.0f)
{
// Add camera look up/down input
AddControllerPitchInput(Value);
}
}

void APlayerInputHandler::Turn(float Value)
{
// Handle turn input
if (Value != 0.0f)
{
// Add camera turn input
AddControllerYawInput(Value);
}
}

void APlayerInputHandler::Jump()
{
// Handle jump input
if (APawn* MyPawn = GetPawn())
{
MyPawn->Jump();
}
}
