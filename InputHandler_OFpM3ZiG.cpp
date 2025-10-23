#include "PlayerInputHandler.h"

// Sets default values
APlayerInputHandler::APlayerInputHandler()
{
	// Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
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
void APlayerInputHandler::SetupInputComponent()
{
	Super::SetupInputComponent();

	if (InputComponent)
	{
		// Bind axis mappings
		InputComponent->BindAxis("MoveForward", this, &APlayerInputHandler::MoveForward);
		InputComponent->BindAxis("MoveRight", this, &APlayerInputHandler::MoveRight);
		InputComponent->BindAxis("LookUp", this, &APlayerInputHandler::LookUp);
		InputComponent->BindAxis("Turn", this, &APlayerInputHandler::Turn);

		// Bind action mappings
		InputComponent->BindAction("Jump", IE_Pressed, this, &APlayerInputHandler::Jump);
		InputComponent->BindAction("Fire", IE_Pressed, this, &APlayerInputHandler::Fire);
	}
}

// Movement functions
void APlayerInputHandler::MoveForward(float Value)
{
	MoveForwardValue = Value;
	// Add movement logic here
}

void APlayerInputHandler::MoveRight(float Value)
{
	MoveRightValue = Value;
	// Add movement logic here
}

// Look functions
void APlayerInputHandler::LookUp(float Value)
{
	// Add look up/down logic here
	AddControllerPitchInput(Value);
}

void APlayerInputHandler::Turn(float Value)
{
	// Add turn logic here
	AddControllerYawInput(Value);
}

// Action functions
void APlayerInputHandler::Jump()
{
	// Add jump logic here
}

void APlayerInputHandler::Fire()
{
	// Add fire logic here
}