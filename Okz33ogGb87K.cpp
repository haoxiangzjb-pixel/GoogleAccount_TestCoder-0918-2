#include "PlayerInputHandler.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"

APlayerInputHandler::APlayerInputHandler()
{
	// Enable ticking
	PrimaryActorTick.bCanEverTick = true;
}

void APlayerInputHandler::BeginPlay()
{
	Super::BeginPlay();

	SetupInputBindings();
}

void APlayerInputHandler::SetupInputBindings()
{
	// Get the enhanced input subsystem
	if (UEnhancedInputLocalPlayerSubsystem* Subsystem = ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(GetLocalPlayer()))
	{
		// Add the input mapping context
		Subsystem->AddMappingContext(InputMappingContext, 0);
	}

	// Bind input actions
	if (UEnhancedInputComponent* PlayerInputComponent = Cast<UEnhancedInputComponent>(InputComponent))
	{
		// Movement
		PlayerInputComponent->BindAction(MoveForwardAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::MoveForward);
		PlayerInputComponent->BindAction(MoveRightAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::MoveRight);

		// Actions
		PlayerInputComponent->BindAction(JumpAction, ETriggerEvent::Started, this, &APlayerInputHandler::Jump);
		PlayerInputComponent->BindAction(FireAction, ETriggerEvent::Started, this, &APlayerInputHandler::Fire);
	}
}

void APlayerInputHandler::MoveForward(float Value)
{
	// Handle forward/backward movement
	if (Value != 0.0f)
	{
		AddMovementInput(GetActorForwardVector(), Value);
	}
}

void APlayerInputHandler::MoveRight(float Value)
{
	// Handle right/left movement
	if (Value != 0.0f)
	{
		AddMovementInput(GetActorRightVector(), Value);
	}
}

void APlayerInputHandler::Jump()
{
	// Handle jump action
	// This is typically called when the jump input is pressed
	bPressedJump = true;
}

void APlayerInputHandler::Fire()
{
	// Handle fire action
	// Add your firing logic here
	// For example, spawn a projectile or activate a weapon
}