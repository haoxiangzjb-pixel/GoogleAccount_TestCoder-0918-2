#include "PlayerInputHandler.h"
#include "GameFramework/Character.h"
#include "GameFramework/Pawn.h"
#include "GameFramework/Controller.h"

APlayerInputHandler::APlayerInputHandler()
{
	// Set this pawn to call Tick() every frame
	PrimaryActorTick.bCanEverTick = true;
}

void APlayerInputHandler::SetupInputComponent()
{
	Super::SetupInputComponent();

	// Bind input functions
	if (InputComponent)
	{
		// Axis mappings
		InputComponent->BindAxis("MoveForward", this, &APlayerInputHandler::MoveForward);
		InputComponent->BindAxis("MoveRight", this, &APlayerInputHandler::MoveRight);
		InputComponent->BindAxis("LookUp", this, &APlayerInputHandler::LookUp);
		InputComponent->BindAxis("Turn", this, &APlayerInputHandler::Turn);

		// Action mappings
		InputComponent->BindAction("Jump", IE_Pressed, this, &APlayerInputHandler::Jump);
	}
}

void APlayerInputHandler::BeginPlay()
{
	Super::BeginPlay();
	// Initialization code here
}

void APlayerInputHandler::MoveForward(float Value)
{
	if (Value != 0.0f)
	{
		APawn* ControlledPawn = GetPawn();
		if (ControlledPawn != nullptr)
		{
			// Add movement in the forward direction
			ControlledPawn->AddMovementInput(ControlledPawn->GetActorForwardVector(), Value);
		}
	}
}

void APlayerInputHandler::MoveRight(float Value)
{
	if (Value != 0.0f)
	{
		APawn* ControlledPawn = GetPawn();
		if (ControlledPawn != nullptr)
		{
			// Add movement in the right direction
			ControlledPawn->AddMovementInput(ControlledPawn->GetActorRightVector(), Value);
		}
	}
}

void APlayerInputHandler::LookUp(float Value)
{
	if (Value != 0.0f)
	{
		AddControllerPitchInput(Value);
	}
}

void APlayerInputHandler::Turn(float Value)
{
	if (Value != 0.0f)
	{
		AddControllerYawInput(Value);
	}
}

void APlayerInputHandler::Jump()
{
	APawn* ControlledPawn = GetPawn();
	if (ControlledPawn && ControlledPawn->CanJump())
	{
		ControlledPawn->Jump();
	}
}