#include "PlayerInputHandler.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"
#include "InputAction.h"

APlayerInputHandler::APlayerInputHandler()
{
	// Set this pawn to call Tick() every frame
	PrimaryActorTick.bCanEverTick = true;
	
	// Default class to use for input component
	bUsePawnControlRotation = false; // Don't rotate character to match controller's rotation
}

void APlayerInputHandler::BeginPlay()
{
	Super::BeginPlay();
	
	// Add input mapping context
	if (UEnhancedInputLocalPlayerSubsystem* Subsystem = ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(GetLocalPlayer()))
	{
		Subsystem->AddMappingContext(DefaultMappingContext, 0);
	}
}

void APlayerInputHandler::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);
}

void APlayerInputHandler::SetupInputComponent()
{
	Super::SetupInputComponent();

	// Set up input actions
	if (UEnhancedInputComponent* EnhancedInputComponent = Cast<UEnhancedInputComponent>(InputComponent))
	{
		// Jump
		EnhancedInputComponent->BindAction(JumpAction, ETriggerEvent::Started, this, &APlayerInputHandler::Jump);

		// Moving
		EnhancedInputComponent->BindAction(MoveForwardAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::MoveForward);
		EnhancedInputComponent->BindAction(MoveRightAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::MoveRight);

		// Looking
		EnhancedInputComponent->BindAction(LookUpAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::LookUp);
		EnhancedInputComponent->BindAction(TurnAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::Turn);
	}
}

void APlayerInputHandler::MoveForward(float Value)
{
	MoveForwardValue = Value;
	
	// Add movement logic here
	if (Controller != nullptr)
	{
		// Find out which way is forward
		const FRotator Rotation = Controller->GetControlRotation();
		const FRotator YawRotation(0, Rotation.Yaw, 0);

		// Get forward vector
		const FVector ForwardDirection = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);

		// Add movement
		AddMovementInput(ForwardDirection, MoveForwardValue);
	}
}

void APlayerInputHandler::MoveRight(float Value)
{
	MoveRightValue = Value;
	
	if (Controller != nullptr)
	{
		// Find out which way is right
		const FRotator Rotation = Controller->GetControlRotation();
		const FRotator YawRotation(0, Rotation.Yaw, 0);
	
		// Get right vector 
		const FVector RightDirection = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);
	
		// Add movement
		AddMovementInput(RightDirection, MoveRightValue);
	}
}

void APlayerInputHandler::LookUp(float Value)
{
	// Add look up/down logic
	AddControllerPitchInput(Value);
}

void APlayerInputHandler::Turn(float Value)
{
	// Add turn logic
	AddControllerYawInput(Value);
}

void APlayerInputHandler::Jump()
{
	// Add jump logic
	APawn::Jump();
}