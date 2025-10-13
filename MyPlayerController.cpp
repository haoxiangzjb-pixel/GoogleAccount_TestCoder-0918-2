// MyPlayerController.cpp
#include "MyPlayerController.h"
#include "Engine/World.h"
#include "GameFramework/Character.h"
#include "GameFramework/PlayerInput.h"
#include "Components/InputComponent.h"

// Sets default values
AMyPlayerController::AMyPlayerController()
{
 	// Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
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
	
	// Bind movement events
	PlayerInputComponent->BindAxis(TEXT("MoveForward"), this, &AMyPlayerController::MoveForward);
	PlayerInputComponent->BindAxis(TEXT("MoveRight"), this, &AMyPlayerController::MoveRight);

	// Bind action events
	PlayerInputComponent->BindAction(TEXT("Jump"), IE_Pressed, this, &ACharacter::Jump);
	PlayerInputComponent->BindAction(TEXT("Jump"), IE_Released, this, &ACharacter::StopJumping);
}

void AMyPlayerController::MoveForward(float Value)
{
	if (Value != 0.0f)
	{
		// Add forward movement input
		AddMovementInput(GetActorForwardVector(), Value);
	}
}

void AMyPlayerController::MoveRight(float Value)
{
	if (Value != 0.0f)
	{
		// Add right movement input
		AddMovementInput(GetActorRightVector(), Value);
	}
}