// Copyright 2025 My Name. All Rights Reserved.

#include "MyPlayerController.h"
#include "Engine/World.h" // Required for GetWorld()


// Sets default values
AMyPlayerController::AMyPlayerController()
{
 	// Set this pawn to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
 PrimaryActorTick.bCanEverTick = true;

}

// Called when the game starts or when spawned
void AMyPlayerController::BeginPlay()
{
	Super::BeginPlay();
	
}

// Called every frame
void AMyPlayerController::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

}

// Called to bind functionality to input
void AMyPlayerController::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
	Super::SetupPlayerInputComponent(PlayerInputComponent);

	// Bind axis mappings
	PlayerInputComponent->BindAxis("MoveForward", this, &AMyPlayerController::MoveForward);
	PlayerInputComponent->BindAxis("MoveRight", this, &AMyPlayerController::MoveRight);

	// Bind action mappings
	PlayerInputComponent->BindAction("Jump", IE_Pressed, this, &AMyPlayerController::Jump);
	PlayerInputComponent->BindAction("Jump", IE_Released, this, &AMyPlayerController::StopJumping);

}

void AMyPlayerController::MoveForward(float Value)
{
	if (Value != 0.0f)
	{
		// Add forward movement logic here
		AddMovementInput(GetActorForwardVector(), Value);
	}
}

void AMyPlayerController::MoveRight(float Value)
{
	if (Value != 0.0f)
	{
		// Add right movement logic here
		AddMovementInput(GetActorRightVector(), Value);
	}
}

void AMyPlayerController::Jump()
{
	bPressedJump = true;
}

void AMyPlayerController::StopJumping()
{
	bPressedJump = false;
}