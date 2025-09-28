#include "MyGamePlayerController.h"

AMyGamePlayerController::AMyGamePlayerController()
{
	// Set this pawn to call Tick() every frame.
	PrimaryActorTick.bCanEverTick = true;
}

void AMyGamePlayerController::SetupInputComponent()
{
	Super::SetupInputComponent();

	// Bind axis mappings
	InputComponent->BindAxis("MoveForward", this, &AMyGamePlayerController::MoveForward);
	InputComponent->BindAxis("MoveRight", this, &AMyGamePlayerController::MoveRight);
	InputComponent->BindAxis("LookUp", this, &AMyGamePlayerController::LookUp);
	InputComponent->BindAxis("Turn", this, &AMyGamePlayerController::Turn);

	// Bind action mappings
	InputComponent->BindAction("Jump", IE_Pressed, this, &AMyGamePlayerController::Jump);
}

void AMyGamePlayerController::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

	// Add custom tick logic here if needed
}

void AMyGamePlayerController::MoveForward(float Value)
{
	MoveForwardAxisValue = Value;
	// Add movement logic here
}

void AMyGamePlayerController::MoveRight(float Value)
{
	MoveRightAxisValue = Value;
	// Add movement logic here
}

void AMyGamePlayerController::LookUp(float Value)
{
	LookUpAxisValue = Value;
	// Add look up/down logic here
}

void AMyGamePlayerController::Turn(float Value)
{
	TurnAxisValue = Value;
	// Add turn logic here
}

void AMyGamePlayerController::Jump()
{
	// Add jump logic here
}