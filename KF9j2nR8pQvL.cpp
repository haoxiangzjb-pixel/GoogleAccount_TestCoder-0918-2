#include "KF9j2nR8pQvL.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"
#include "InputAction.h"
#include "InputMappingContext.h"
#include "Components/InputComponent.h"

// Sets default values
AKF9j2nR8pQvL::AKF9j2nR8pQvL()
{
 	// Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;
}

// Called when the game starts or when spawned
void AKF9j2nR8pQvL::BeginPlay()
{
	Super::BeginPlay();
	
	// Add input mapping context
	if (UEnhancedInputLocalPlayerSubsystem* Subsystem = ULocalPlayer::GetEnhancedInputSubsystem(GetLocalPlayer()))
	{
		Subsystem->AddMappingContext(DefaultMappingContext, 0);
	}
}

// Called every frame
void AKF9j2nR8pQvL::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);
}

// Called to bind functionality to input
void AKF9j2nR8pQvL::SetupInputComponent()
{
	Super::SetupInputComponent();

	// Set up action bindings
	if (UEnhancedInputComponent* PlayerInputComponent = Cast<UEnhancedInputComponent>(InputComponent))
	{
		// Binding the input actions
		PlayerInputComponent->BindAction(MoveForwardAction, ETriggerEvent::Triggered, this, &AKF9j2nR8pQvL::MoveForward);
		PlayerInputComponent->BindAction(MoveRightAction, ETriggerEvent::Triggered, this, &AKF9j2nR8pQvL::MoveRight);
		PlayerInputComponent->BindAction(LookUpAction, ETriggerEvent::Triggered, this, &AKF9j2nR8pQvL::LookUp);
		PlayerInputComponent->BindAction(TurnAction, ETriggerEvent::Triggered, this, &AKF9j2nR8pQvL::Turn);
		PlayerInputComponent->BindAction(JumpAction, ETriggerEvent::Triggered, this, &AKF9j2nR8pQvL::Jump);
		PlayerInputComponent->BindAction(FireAction, ETriggerEvent::Started, this, &AKF9j2nR8pQvL::Fire);
	}
}

void AKF9j2nR8pQvL::MoveForward(float Value)
{
	if (GetPawn() != nullptr)
	{
		// find out which way is forward
		const FRotator Rotation = GetControlRotation();
		const FRotator YawRotation(0, Rotation.Yaw, 0);

		// get forward vector
		const FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);
		GetPawn()->AddMovementInput(Direction, Value);
	}
}

void AKF9j2nR8pQvL::MoveRight(float Value)
{
	if (GetPawn() != nullptr)
	{
		// find out which way is right
		const FRotator Rotation = GetControlRotation();
		const FRotator YawRotation(0, Rotation.Yaw, 0);

		// get right vector 
		const FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);
		GetPawn()->AddMovementInput(Direction, Value);
	}
}

void AKF9j2nR8pQvL::LookUp(float Value)
{
	if (GetPawn() != nullptr)
	{
		AddControllerPitchInput(Value);
	}
}

void AKF9j2nR8pQvL::Turn(float Value)
{
	if (GetPawn() != nullptr)
	{
		AddControllerYawInput(Value);
	}
}

void AKF9j2nR8pQvL::Jump()
{
	if (GetPawn() != nullptr)
	{
		GetPawn()->Jump();
	}
}

void AKF9j2nR8pQvL::Fire()
{
	// Add firing logic here
	// For example, trigger weapon firing, special ability, etc.
}