// Z96VQzJcne6C.cpp
// Player Input Handler for Unreal Engine
// This class handles player input in a Unreal Engine project

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "GameFramework/Character.h"
#include "GameFramework/CharacterMovementComponent.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"
#include "InputAction.h"
#include "InputActionValue.h"

// Assuming we have a class declaration in the header file
// This would be the implementation file

class PlayerInputHandler : public APlayerController
{
public:
    // Called when the game starts or when spawned
    virtual void BeginPlay() override;
    
    // Called every frame
    virtual void Tick(float DeltaTime) override;
    
    // Setup input mapping
    virtual void SetupInputComponent() override;
    
    // Input action handlers
    void Move(const FInputActionValue& Value);
    void Look(const FInputActionValue& Value);
    void Jump();
    void StopJumping();
    
private:
    // Reference to the character we're controlling
    ACharacter* ControlledCharacter;
    
    // Input mapping context
    UInputMappingContext* DefaultMappingContext;
    
    // Input actions
    UInputAction* MoveAction;
    UInputAction* LookAction;
    UInputAction* JumpAction;
};

// Implementation

void PlayerInputHandler::BeginPlay()
{
    Super::BeginPlay();
    
    // Get the character we're controlling
    ControlledCharacter = GetCharacter();
    
    // Add input mapping context
    if (UEnhancedInputLocalPlayerSubsystem* Subsystem = ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(GetLocalPlayer()))
    {
        Subsystem->AddMappingContext(DefaultMappingContext, 0);
    }
}

void PlayerInputHandler::Tick(float DeltaTime)
{
    Super::Tick(DeltaTime);
}

void PlayerInputHandler::SetupInputComponent()
{
    Super::SetupInputComponent();
    
    // Cast to enhanced input component
    if (UEnhancedInputComponent* EnhancedInputComponent = Cast<UEnhancedInputComponent>(InputComponent))
    {
        // Bind actions
        EnhancedInputComponent->BindAction(MoveAction, ETriggerEvent::Triggered, this, &PlayerInputHandler::Move);
        EnhancedInputComponent->BindAction(LookAction, ETriggerEvent::Triggered, this, &PlayerInputHandler::Look);
        EnhancedInputComponent->BindAction(JumpAction, ETriggerEvent::Started, this, &PlayerInputHandler::Jump);
        EnhancedInputComponent->BindAction(JumpAction, ETriggerEvent::Completed, this, &PlayerInputHandler::StopJumping);
    }
}

void PlayerInputHandler::Move(const FInputActionValue& Value)
{
    // Get the input vector
    FVector2D MovementVector = Value.Get<FVector2D>();
    
    if (ControlledCharacter)
    {
        // Find forward and right directions
        const FRotator Rotation = ControlledCharacter->GetControlRotation();
        const FRotator YawRotation(0, Rotation.Yaw, 0);
        
        // Get forward and right vectors
        const FVector ForwardDirection = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);
        const FVector RightDirection = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);
        
        // Add movement
        ControlledCharacter->AddMovementInput(ForwardDirection, MovementVector.Y);
        ControlledCharacter->AddMovementInput(RightDirection, MovementVector.X);
    }
}

void PlayerInputHandler::Look(const FInputActionValue& Value)
{
    // Get the input vector
    FVector2D LookAxisVector = Value.Get<FVector2D>();
    
    if (ControlledCharacter)
    {
        // Add camera yaw and pitch input
        ControlledCharacter->AddControllerYawInput(LookAxisVector.X);
        ControlledCharacter->AddControllerPitchInput(LookAxisVector.Y);
    }
}

void PlayerInputHandler::Jump()
{
    if (ControlledCharacter)
    {
        ControlledCharacter->Jump();
    }
}

void PlayerInputHandler::StopJumping()
{
    if (ControlledCharacter)
    {
        ControlledCharacter->StopJumping();
    }
}