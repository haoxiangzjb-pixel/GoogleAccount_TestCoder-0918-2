// YLeGH2tspGxE.cpp
// Player Input Handler for Unreal Engine

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "GameFramework/Character.h"
#include "GameFramework/CharacterMovementComponent.h"
#include "YLeGH2tspGxE.h"

// Sets default values
AYLeGH2tspGxE::AYLeGH2tspGxE()
{
    // Set this character to call Tick() every frame. You can turn this off to improve performance if you don't need it.
    PrimaryActorTick.bCanEverTick = true;
}

// Called when the game starts or when spawned
void AYLeGH2tspGxE::BeginPlay()
{
    Super::BeginPlay();
}

// Called every frame
void AYLeGH2tspGxE::Tick(float DeltaTime)
{
    Super::Tick(DeltaTime);
}

// Called to bind functionality to input
void AYLeGH2tspGxE::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
    Super::SetupPlayerInputComponent(PlayerInputComponent);

    // Binding input actions
    PlayerInputComponent->BindAxis("MoveForward", this, &AYLeGH2tspGxE::MoveForward);
    PlayerInputComponent->BindAxis("MoveRight", this, &AYLeGH2tspGxE::MoveRight);
    PlayerInputComponent->BindAxis("Turn", this, &AYLeGH2tspGxE::Turn);
    PlayerInputComponent->BindAxis("LookUp", this, &AYLeGH2tspGxE::LookUp);
    
    PlayerInputComponent->BindAction("Jump", IE_Pressed, this, &AYLeGH2tspGxE::Jump);
    PlayerInputComponent->BindAction("Jump", IE_Released, this, &AYLeGH2tspGxE::StopJumping);
}

void AYLeGH2tspGxE::MoveForward(float Value)
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

void AYLeGH2tspGxE::MoveRight(float Value)
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

void AYLeGH2tspGxE::Turn(float Rate)
{
    // Calculate delta for this frame from the rate information
    AddControllerYawInput(Rate * BaseTurnRate * GetWorld()->GetDeltaSeconds());
}

void AYLeGH2tspGxE::LookUp(float Rate)
{
    // Calculate delta for this frame from the rate information
    AddControllerPitchInput(Rate * BaseLookUpRate * GetWorld()->GetDeltaSeconds());
}