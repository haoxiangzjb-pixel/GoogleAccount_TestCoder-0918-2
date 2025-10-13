#include "MyPlayerController.h"
#include "Engine/World.h"

AMyPlayerController::AMyPlayerController()
{
	// Enable ticking
	PrimaryActorTick.bCanEverTick = true;
}

void AMyPlayerController::BeginPlay()
{
	Super::BeginPlay();
	
}

void AMyPlayerController::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

	// Handle input values here
	// Example: Apply movement based on InputMoveForward and InputMoveRight
	// APawn* MyPawn = GetPawn();
	// if (MyPawn)
	// {
	// 	FVector MoveDirection = FVector(InputMoveForward, InputMoveRight, 0.0f);
	// 	MyPawn->AddMovementInput(MoveDirection, DeltaTime);
	// }
}

void AMyPlayerController::SetupInputComponent()
{
	Super::SetupInputComponent();

	if (UInputComponent* PlayerInputComponent = Cast<UInputComponent>(InputComponent))
	{
		// Bind axis mappings
		PlayerInputComponent->BindAxis("MoveForward", this, &AMyPlayerController::MoveForward);
		PlayerInputComponent->BindAxis("MoveRight", this, &AMyPlayerController::MoveRight);
		PlayerInputComponent->BindAxis("LookUp", this, &AMyPlayerController::LookUp);
		PlayerInputComponent->BindAxis("Turn", this, &AMyPlayerController::Turn);
	}
}

void AMyPlayerController::MoveForward(float Value)
{
	InputMoveForward = Value;
}

void AMyPlayerController::MoveRight(float Value)
{
	InputMoveRight = Value;
}

void AMyPlayerController::LookUp(float Value)
{
	InputLookUp = Value;
}

void AMyPlayerController::Turn(float Value)
{
	InputTurn = Value;
}