#include "PlayerInputHandler_9481d7b646b70206.h"
#include "Engine/World.h"

// Sets default values
APlayerInputHandler_9481d7b646b70206::APlayerInputHandler_9481d7b646b70206()
{
	// Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;
}

// Called when the game starts or when spawned
void APlayerInputHandler_9481d7b646b70206::BeginPlay()
{
	Super::BeginPlay();
}

// Called every frame
void APlayerInputHandler_9481d7b646b70206::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);
}

// Called to bind functionality to input
void APlayerInputHandler_9481d7b646b70206::SetupInputComponent()
{
	Super::SetupInputComponent();

	if (InputComponent)
	{
		// Bind movement events
		InputComponent->BindAxis("MoveForward", this, &APlayerInputHandler_9481d7b646b70206::MoveForward);
		InputComponent->BindAxis("MoveRight", this, &APlayerInputHandler_9481d7b646b70206::MoveRight);

		// Bind look events
		InputComponent->BindAxis("LookUp", this, &APlayerInputHandler_9481d7b646b70206::LookUp);
		InputComponent->BindAxis("Turn", this, &APlayerInputHandler_9481d7b646b70206::Turn);

		// Bind action events
		InputComponent->BindAction("Jump", IE_Pressed, this, &APlayerInputHandler_9481d7b646b70206::Jump);
		InputComponent->BindAction("Fire", IE_Pressed, this, &APlayerInputHandler_9481d7b646b70206::Fire);
	}
}

// Movement functions
void APlayerInputHandler_9481d7b646b70206::MoveForward(float Value)
{
	MoveForwardValue = Value;
	// Add movement logic here
	if (Value != 0.0f)
	{
		// Move the player forward/backward
		AddMovementInput(GetActorForwardVector(), Value);
	}
}

void APlayerInputHandler_9481d7b646b70206::MoveRight(float Value)
{
	MoveRightValue = Value;
	// Add movement logic here
	if (Value != 0.0f)
	{
		// Move the player right/left
		AddMovementInput(GetActorRightVector(), Value);
	}
}

// Look functions
void APlayerInputHandler_9481d7b646b70206::LookUp(float Value)
{
	if (Value != 0.0f)
	{
		// Add look up/down logic here
		AddControllerPitchInput(Value);
	}
}

void APlayerInputHandler_9481d7b646b70206::Turn(float Value)
{
	if (Value != 0.0f)
	{
		// Add turn logic here
		AddControllerYawInput(Value);
	}
}

// Action functions
void APlayerInputHandler_9481d7b646b70206::Jump()
{
	// Add jump logic here
	// For example, if the character has a CharacterMovementComponent:
	// ACharacter* Character = Cast<ACharacter>(GetPawn());
	// if (Character && Character->CanJump())
	// {
	//     Character->Jump();
	// }
}

void APlayerInputHandler_9481d7b646b70206::Fire()
{
	// Add fire logic here
	// For example, trigger weapon firing or other action
}