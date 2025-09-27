#include "MyGamePlayerController.h"
#include "Engine/World.h"

AMyGamePlayerController::AMyGamePlayerController()
{
	// Enable ticking for this controller
	PrimaryActorTick.bCanEverTick = true;
}

void AMyGamePlayerController::SetupInputComponent()
{
	Super::SetupInputComponent();

	// Bind actions
	if (InputComponent)
	{
		InputComponent->BindAxis("MoveForward", this, &AMyGamePlayerController::MoveForward);
		InputComponent->BindAxis("MoveRight", this, &AMyGamePlayerController::MoveRight);
		InputComponent->BindAxis("LookUp", this, &AMyGamePlayerController::LookUp);
		InputComponent->BindAxis("Turn", this, &AMyGamePlayerController::Turn);
		InputComponent->BindAction("Jump", IE_Pressed, this, &AMyGamePlayerController::Jump);
	}
}

void AMyGamePlayerController::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

	// Use the input values stored in variables
	// Example: Apply movement based on input values
	// APawn* ControlledPawn = GetPawn();
	// if (ControlledPawn)
	// {
	// 	ControlledPawn->AddMovementInput(ControlledPawn->GetActorForwardVector(), MoveForwardValue);
	// 	ControlledPawn->AddMovementInput(ControlledPawn->GetActorRightVector(), MoveRightValue);
	// }
}

void AMyGamePlayerController::MoveForward(float Value)
{
	MoveForwardValue = Value;
}

void AMyGamePlayerController::MoveRight(float Value)
{
	MoveRightValue = Value;
}

void AMyGamePlayerController::LookUp(float Value)
{
	LookUpValue = Value;
}

void AMyGamePlayerController::Turn(float Value)
{
	TurnValue = Value;
}

void AMyGamePlayerController::Jump()
{
	// Handle jump logic here
}