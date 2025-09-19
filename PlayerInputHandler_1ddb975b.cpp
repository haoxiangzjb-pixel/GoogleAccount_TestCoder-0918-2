// PlayerInputHandler_1ddb975b.cpp
// A custom class for handling player input in Unreal Engine

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "GameFramework/Character.h"
#include "GameFramework/CharacterMovementComponent.h"
#include "PlayerInputHandler_1ddb975b.h"

// Sets default values
APlayerInputHandler_1ddb975b::APlayerInputHandler_1ddb975b()
{
    // Set this character to call Tick() every frame. You can turn this off to improve performance if you don't need it.
    PrimaryActorTick.bCanEverTick = true;
}

// Called when the game starts or when spawned
void APlayerInputHandler_1ddb975b::BeginPlay()
{
    Super::BeginPlay();
}

// Called every frame
void APlayerInputHandler_1ddb975b::Tick(float DeltaTime)
{
    Super::Tick(DeltaTime);
}

// Called to bind functionality to input
void APlayerInputHandler_1ddb975b::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
    Super::SetupPlayerInputComponent(PlayerInputComponent);

    // Binding input actions
    PlayerInputComponent->BindAxis("MoveForward", this, &APlayerInputHandler_1ddb975b::MoveForward);
    PlayerInputComponent->BindAxis("MoveRight", this, &APlayerInputHandler_1ddb975b::MoveRight);
    PlayerInputComponent->BindAxis("Turn", this, &APlayerInputHandler_1ddb975b::Turn);
    PlayerInputComponent->BindAxis("LookUp", this, &APlayerInputHandler_1ddb975b::LookUp);

    // Binding action mappings
    PlayerInputComponent->BindAction("Jump", IE_Pressed, this, &APlayerInputHandler_1ddb975b::Jump);
    PlayerInputComponent->BindAction("Jump", IE_Released, this, &APlayerInputHandler_1ddb975b::StopJumping);
}

void APlayerInputHandler_1ddb975b::MoveForward(float Value)
{
    if ((Controller != nullptr) && (Value != 0.0f))
    {
        // Find out which way is forward
        const FRotator Rotation = Controller->GetControlRotation();
        const FRotator YawRotation(0, Rotation.Yaw, 0);

        // Get forward vector
        const FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);
        AddMovementInput(Direction, Value);
    }
}

void APlayerInputHandler_1ddb975b::MoveRight(float Value)
{
    if ((Controller != nullptr) && (Value != 0.0f))
    {
        // Find out which way is right
        const FRotator Rotation = Controller->GetControlRotation();
        const FRotator YawRotation(0, Rotation.Yaw, 0);

        // Get right vector
        const FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);
        AddMovementInput(Direction, Value);
    }
}

void APlayerInputHandler_1ddb975b::Turn(float Rate)
{
    // Calculate delta for this frame from the rate information
    AddControllerYawInput(Rate * BaseTurnRate * GetWorld()->GetDeltaSeconds());
}

void APlayerInputHandler_1ddb975b::LookUp(float Rate)
{
    // Calculate delta for this frame from the rate information
    AddControllerPitchInput(Rate * BaseLookUpRate * GetWorld()->GetDeltaSeconds());
}

void APlayerInputHandler_1ddb975b::Jump()
{
    ACharacter::Jump();
}

void APlayerInputHandler_1ddb975b::StopJumping()
{
    ACharacter::StopJumping();
}