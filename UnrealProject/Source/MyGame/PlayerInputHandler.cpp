// PlayerInputHandler.cpp
// A C++ class for handling player input in Unreal Engine

#include "PlayerInputHandler.h"
#include "GameFramework/Pawn.h"
#include "GameFramework/PlayerController.h"
#include "Engine/World.h"

// Sets default values
APlayerInputHandler::APlayerInputHandler()
{
 	// Set this pawn to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;

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

	// Binding input actions
	PlayerInputComponent->BindAxis(TEXT("MoveForward"), this, &APlayerInputHandler::MoveForward);
	PlayerInputComponent->BindAxis(TEXT("MoveRight"), this, &APlayerInputHandler::MoveRight);
	PlayerInputComponent->BindAxis(TEXT("Turn"), this, &APlayerInputHandler::Turn);
	PlayerInputComponent->BindAxis(TEXT("LookUp"), this, &APlayerInputHandler::LookUp);
	
	// Binding action mappings
	PlayerInputComponent->BindAction(TEXT("Jump"), IE_Pressed, this, &APlayerInputHandler::Jump);
	PlayerInputComponent->BindAction(TEXT("Jump"), IE_Released, this, &APlayerInputHandler::StopJumping);
}

// Input functions
void APlayerInputHandler::MoveForward(float Value)
{
	if (Controller && Value != 0.0f)
	{
		// Find forward direction
		const FRotator Rotation = Controller->GetControlRotation();
		const FRotator YawRotation(0, Rotation.Yaw, 0);
		
		// Get forward vector
		const FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);
		AddMovementInput(Direction, Value);
	}
}

void APlayerInputHandler::MoveRight(float Value)
{
	if (Controller && Value != 0.0f)
	{
		// Find right direction
		const FRotator Rotation = Controller->GetControlRotation();
		const FRotator YawRotation(0, Rotation.Yaw, 0);
		
		// Get right vector
		const FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);
		AddMovementInput(Direction, Value);
	}
}

void APlayerInputHandler::Turn(float Rate)
{
	// Calculate delta for this frame from the rate information
	AddControllerYawInput(Rate * BaseTurnRate * GetWorld()->GetDeltaSeconds());
}

void APlayerInputHandler::LookUp(float Rate)
{
	// Calculate delta for this frame from the rate information
	AddControllerPitchInput(Rate * BaseLookUpRate * GetWorld()->GetDeltaSeconds());
}

void APlayerInputHandler::Jump()
{
	bPressedJump = true;
}

void APlayerInputHandler::StopJumping()
{
	bPressedJump = false;
}