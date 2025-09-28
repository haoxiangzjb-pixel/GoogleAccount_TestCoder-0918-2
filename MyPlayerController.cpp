// Fill out your copyright notice in the Description page of Project Settings.

#include "MyPlayerController.h"

AMyPlayerController::AMyPlayerController()
{
	// Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;
}

void AMyPlayerController::SetupPlayerInputComponent(class UInputComponent* PlayerInputComponent)
{
	Super::SetupPlayerInputComponent(PlayerInputComponent);

	// Bind action for jumping
	if (UInputAction* JumpAction = Cast<UInputAction>(JumpMapping.GetAsset()))
	{
		PlayerInputComponent->BindAction(JumpAction, ETriggerEvent::Triggered, this, &ACharacter::Jump);
	}

	// Bind action for moving forward/backward
	if (UInputAction* MoveAction = Cast<UInputAction>(MoveMapping.GetAsset()))
	{
		PlayerInputComponent->BindAxis(MoveAction, this, &AMyPlayerController::MoveForward);
	}

	// Bind action for moving right/left
	if (UInputAction* MoveAction = Cast<UInputAction>(StrafeMapping.GetAsset()))
	{
		PlayerInputComponent->BindAxis(MoveAction, this, &AMyPlayerController::MoveRight);
	}
}

void AMyPlayerController::MoveForward(float Value)
{
	if (Value != 0.0f)
	{
		// Add movement in the forward direction
		AddMovementInput(GetActorForwardVector(), Value);
	}
}

void AMyPlayerController::MoveRight(float Value)
{
	if (Value != 0.0f)
	{
		// Add movement in the right direction
		AddMovementInput(GetActorRightVector(), Value);
	}
}