#include "PlayerInputHandler.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"

APlayerInputHandler::APlayerInputHandler()
{
}

void APlayerInputHandler::BeginPlay()
{
    Super::BeginPlay();

    // Add Input Mapping Context
    if (APlayerController* PlayerController = Cast<APlayerController>(GetController()))
    {
        if (UEnhancedInputLocalPlayerSubsystem* Subsystem = ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(PlayerController->GetLocalPlayer()))
        {
            Subsystem->AddMappingContext(DefaultMappingContext, 0);
        }
    }
}

void APlayerInputHandler::Tick(float DeltaTime)
{
    Super::Tick(DeltaTime);
}

void APlayerInputHandler::SetupInputComponent()
{
    Super::SetupInputComponent();

    // Set up action bindings
    if (UEnhancedInputComponent* EnhancedInputComponent = Cast<UEnhancedInputComponent>(InputComponent))
    {
        // Movement
        EnhancedInputComponent->BindAction(MoveForwardAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::MoveForward);
        EnhancedInputComponent->BindAction(MoveRightAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::MoveRight);

        // Looking
        EnhancedInputComponent->BindAction(LookUpAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::LookUp);
        EnhancedInputComponent->BindAction(TurnAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::Turn);

        // Actions
        EnhancedInputComponent->BindAction(JumpAction, ETriggerEvent::Started, this, &APlayerInputHandler::Jump);
        EnhancedInputComponent->BindAction(FireAction, ETriggerEvent::Started, this, &APlayerInputHandler::Fire);
    }
}

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

void APlayerInputHandler::LookUp(float Value)
{
    if (Value != 0.0f)
    {
        // Add look up/down input
        AddControllerPitchInput(Value);
    }
}

void APlayerInputHandler::Turn(float Value)
{
    if (Value != 0.0f)
    {
        // Add turn left/right input
        AddControllerYawInput(Value);
    }
}

void APlayerInputHandler::Jump()
{
    // Handle jump action
    ACharacter* Character = Cast<ACharacter>(GetPawn());
    if (Character)
    {
        Character->Jump();
    }
}

void APlayerInputHandler::Fire()
{
    // Handle fire action
    // Add your firing logic here
}