// PlayerInputHandler.cpp
// Implementation of the player input handler class

#include "PlayerInputHandler.h"
#include "GameFramework/CharacterMovementComponent.h"
#include "Components/InputComponent.h"

// Sets default values
APlayerInputHandler::APlayerInputHandler()
{
    // Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
    PrimaryActorTick.bCanEverTick = true;

    // Set default values for movement
    BaseMovementSpeed = 600.0f;
    SprintSpeedMultiplier = 2.0f;
    BaseTurnRate = 45.0f;
    BaseLookUpRate = 45.0f;
    bIsSprinting = false;
    
    // Get the character movement component
    if (GetCharacterMovement())
    {
        GetCharacterMovement()->MaxWalkSpeed = BaseMovementSpeed;
    }
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

    // Movement bindings
    PlayerInputComponent->BindAxis("MoveForward", this, &APlayerInputHandler::MoveForward);
    PlayerInputComponent->BindAxis("MoveRight", this, &APlayerInputHandler::MoveRight);
    
    // Mouse look bindings
    PlayerInputComponent->BindAxis("Turn", this, &APlayerInputHandler::Turn);
    PlayerInputComponent->BindAxis("LookUp", this, &APlayerInputHandler::LookUp);
    
    // Action bindings
    PlayerInputComponent->BindAction("Jump", IE_Pressed, this, &APlayerInputHandler::Jump);
    PlayerInputComponent->BindAction("Jump", IE_Released, this, &APlayerInputHandler::StopJumping);
    PlayerInputComponent->BindAction("Sprint", IE_Pressed, this, &APlayerInputHandler::SprintStart);
    PlayerInputComponent->BindAction("Sprint", IE_Released, this, &APlayerInputHandler::SprintStop);
}

// Input functions
void APlayerInputHandler::MoveForward(float Value)
{
    if (Value != 0.0f)
    {
        // Add movement in the forward direction
        AddMovementInput(GetActorForwardVector(), Value);
    }
}

void APlayerInputHandler::MoveRight(float Value)
{
    if (Value != 0.0f)
    {
        // Add movement in the right direction
        AddMovementInput(GetActorRightVector(), Value);
    }
}

void APlayerInputHandler::Turn(float Rate)
{
    // Calculate the delta for this frame from the rate information
    AddControllerYawInput(Rate * BaseTurnRate * GetWorld()->GetDeltaSeconds());
}

void APlayerInputHandler::LookUp(float Rate)
{
    // Calculate the delta for this frame from the rate information
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

void APlayerInputHandler::SprintStart()
{
    bIsSprinting = true;
    if (GetCharacterMovement())
    {
        GetCharacterMovement()->MaxWalkSpeed = BaseMovementSpeed * SprintSpeedMultiplier;
    }
}

void APlayerInputHandler::SprintStop()
{
    bIsSprinting = false;
    if (GetCharacterMovement())
    {
        GetCharacterMovement()->MaxWalkSpeed = BaseMovementSpeed;
    }
}