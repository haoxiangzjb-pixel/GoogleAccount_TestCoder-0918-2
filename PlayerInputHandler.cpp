#include "PlayerInputHandler.h"
#include "GameFramework/SpringArmComponent.h"
#include "Camera/CameraComponent.h"
#include "Components/InputComponent.h"

// Sets default values
APlayerInputHandler::APlayerInputHandler()
{
 	// Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;

	// Create default objects
	ForwardMoveSpeed = 0.0f;
	RightMoveSpeed = 0.0f;
}

// Called when the game starts or when spawned
void APlayerInputHandler::BeginPlay()
{
	Super::BeginPlay();
	
}

// Called every frame
void APlayerInputHandler::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

}

// Called to bind functionality to input
void APlayerInputHandler::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
	Super::SetupPlayerInputComponent(PlayerInputComponent);

	// Bind movement events
	PlayerInputComponent->BindAxis(TEXT("MoveForward"), this, &APlayerInputHandler::MoveForward);
	PlayerInputComponent->BindAxis(TEXT("MoveRight"), this, &APlayerInputHandler::MoveRight);

	// Bind look events
	PlayerInputComponent->BindAxis(TEXT("LookUp"), this, &APlayerInputHandler::LookUp);
	PlayerInputComponent->BindAxis(TEXT("Turn"), this, &APlayerInputHandler::Turn);
}

void APlayerInputHandler::MoveForward(float Value)
{
	if (Value != 0.0f)
	{
		ForwardMoveSpeed = Value;
		// Add movement in the forward direction
		AddMovementInput(GetActorForwardVector(), Value);
	}
}

void APlayerInputHandler::MoveRight(float Value)
{
	if (Value != 0.0f)
	{
		RightMoveSpeed = Value;
		// Add movement in the right direction
		AddMovementInput(GetActorRightVector(), Value);
	}
}

void APlayerInputHandler::LookUp(float Value)
{
	if (Value != 0.0f)
	{
		// Add look up/down input
		AddControllerPitchInput(Value);
	}
}

void APlayerInputHandler::Turn(float Value)
{
	if (Value != 0.0f)
	{
		// Add turn input
		AddControllerYawInput(Value);
	}
}