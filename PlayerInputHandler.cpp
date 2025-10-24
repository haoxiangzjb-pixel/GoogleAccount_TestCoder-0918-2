#include "PlayerInputHandler.h"
#include "GameFramework/Character.h"
#include "GameFramework/Pawn.h"
#include "Engine/World.h"

APlayerInputHandler::APlayerInputHandler()
{
	// Set this pawn to call Tick() every frame
	PrimaryActorTick.bCanEverTick = true;
}

void APlayerInputHandler::SetupInputComponent()
{
	Super::SetupInputComponent();

	// Bind action mappings
	if (InputComponent)
	{
		// Axis mappings
		InputComponent->BindAxis("MoveForward", this, &APlayerInputHandler::MoveForward);
		InputComponent->BindAxis("MoveRight", this, &APlayerInputHandler::MoveRight);
		InputComponent->BindAxis("LookUp", this, &APlayerInputHandler::LookUp);
		InputComponent->BindAxis("Turn", this, &APlayerInputHandler::Turn);

		// Action mappings
		InputComponent->BindAction("Jump", IE_Pressed, this, &APlayerInputHandler::Jump);
		InputComponent->BindAction("Shoot", IE_Pressed, this, &APlayerInputHandler::Shoot);
	}
}

void APlayerInputHandler::BeginPlay()
{
	Super::BeginPlay();
	// Additional initialization code can go here
}

void APlayerInputHandler::MoveForward(float Value)
{
	if (Value != 0.0f)
	{
		APawn* ControlledPawn = GetPawn();
		if (ControlledPawn != nullptr)
		{
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
	if (ControlledPawn != nullptr && ControlledPawn->CanJump())
	{
		ControlledPawn->Jump();
	}
}

void APlayerInputHandler::Shoot()
{
	// Shooting logic would go here
	// For example, spawn a projectile or trigger weapon effects
}