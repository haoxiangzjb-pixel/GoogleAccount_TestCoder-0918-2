#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Character.h"
#include "PlayerInputHandler.generated.h"

UCLASS()
class APlayerInputHandler : public ACharacter
{
    GENERATED_BODY()

public:
    // Sets default values for this character's properties
    APlayerInputHandler();

protected:
    // Called when the game starts or when spawned
    virtual void BeginPlay() override;

public:
    // Called every frame
    virtual void Tick(float DeltaTime) override;

    // Called to bind functionality to input
    virtual void SetupPlayerInputComponent(class UInputComponent* PlayerInputComponent) override;

    // Movement functions
    void MoveForward(float Value);
    void MoveRight(float Value);

    // Look functions
    void LookUp(float Value);
    void Turn(float Value);

    // Action functions
    void JumpAction();
    void FireAction();

private:
    // Input mapping context
    class UInputMappingContext* InputMappingContext;
    class UInputAction* MoveForwardAction;
    class UInputAction* MoveRightAction;
    class UInputAction* LookUpAction;
    class UInputAction* TurnAction;
    class UInputAction* JumpActionInput;
    class UInputAction* FireActionInput;
    
    // Camera components
    class USpringArmComponent* CameraBoom;
    class UCameraComponent* FollowCamera;
};