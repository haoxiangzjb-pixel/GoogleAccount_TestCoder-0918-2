// nbM2cZJYAu.cpp
// Player input handler class for Unreal Engine

#include "nbM2cZJYAu.h"
#include "GameFramework/Pawn.h"
#include "GameFramework/PlayerController.h"
#include "Components/InputComponent.h"

// Sets default values
AnbM2cZJYAu::AnbM2cZJYAu()
{
 	// Set this pawn to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;

}

// Called when the game starts or when spawned
void AnbM2cZJYAu::BeginPlay()
{
	Super::BeginPlay();
	
}

// Called every frame
void AnbM2cZJYAu::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

}

// Called to bind functionality to input
void AnbM2cZJYAu::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
	Super::SetupPlayerInputComponent(PlayerInputComponent);

	// Bind input actions
	PlayerInputComponent->BindAxis(TEXT("MoveForward"), this, &AnbM2cZJYAu::MoveForward);
	PlayerInputComponent->BindAxis(TEXT("MoveRight"), this, &AnbM2cZJYAu::MoveRight);
	PlayerInputComponent->BindAxis(TEXT("Turn"), this, &AnbM2cZJYAu::Turn);
	PlayerInputComponent->BindAxis(TEXT("LookUp"), this, &AnbM2cZJYAu::LookUp);
	
	// Bind action events
	PlayerInputComponent->BindAction(TEXT("Jump"), IE_Pressed, this, &AnbM2cZJYAu::Jump);
	PlayerInputComponent->BindAction(TEXT("Jump"), IE_Released, this, &AnbM2cZJYAu::StopJumping);
}

// Input functions
void AnbM2cZJYAu::MoveForward(float Value)
{
	if ((Controller != nullptr) && (Value != 0.0f))
	{
		// find out which way is forward
		const FRotator Rotation = Controller->GetControlRotation();
		const FRotator YawRotation(0, Rotation.Yaw, 0);

		// get forward vector
		const FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);
		AddMovementInput(Direction, Value);
	}
}

void AnbM2cZJYAu::MoveRight(float Value)
{
	if ((Controller != nullptr) && (Value != 0.0f))
	{
		// find out which way is right
		const FRotator Rotation = Controller->GetControlRotation();
		const FRotator YawRotation(0, Rotation.Yaw, 0);
	
		// get right vector 
		const FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);
		// add movement in that direction
		AddMovementInput(Direction, Value);
	}
}

void AnbM2cZJYAu::Turn(float Rate)
{
	// calculate delta for this frame from the rate information
	AddControllerYawInput(Rate * BaseTurnRate * GetWorld()->GetDeltaSeconds());
}

void AnbM2cZJYAu::LookUp(float Rate)
{
	// calculate delta for this frame from the rate information
	AddControllerPitchInput(Rate * BaseLookUpRate * GetWorld()->GetDeltaSeconds());
}

void AnbM2cZJYAu::Jump()
{
	bPressedJump = true;
}

void AnbM2cZJYAu::StopJumping()
{
	bPressedJump = false;
}