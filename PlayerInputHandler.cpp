#include "PlayerInputHandler.h"
#include "Engine/World.h"

APlayerInputHandler::APlayerInputHandler()
{
	// Enable ticking
	PrimaryActorTick.bCanEverTick = true;
}

void APlayerInputHandler::SetupInputComponent()
{
	Super::SetupInputComponent();

	// Bind input functions to axis and action mappings
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
		// Add movement in the forward direction
		AddMovementInput(GetActorForwardVector(), Value);
	}
}

void APlayerInputHandler::MoveRight(float Value)
{
	if (Value != 0.0f)
	{
		// Add movement in the right direction
		AddMovementInput(GetActorRightVector(), Value);
	}
}

void APlayerInputHandler::LookUp(float Value)
{
	if (Value != 0.0f)
	{
		// Add camera look up/down
		AddControllerPitchInput(Value);
	}
}

void APlayerInputHandler::Turn(float Value)
{
	if (Value != 0.0f)
	{
		// Add camera turn left/right
		AddControllerYawInput(Value);
	}
}

void APlayerInputHandler::Jump()
{
	// Handle jump action
	ACharacter* Character = Cast<ACharacter>(GetPawn());
	if (Character)
	{
		Character->Jump();
	}
}