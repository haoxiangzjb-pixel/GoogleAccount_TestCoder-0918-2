// PlayerInputHandler.h
// Header file for the player input handler class

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Actor.h"
#include "PlayerInputHandler.generated.h"

UCLASS()
class APlayerInputHandler : public AActor
{
    GENERATED_BODY()
    
public:    
    // Constructor
    APlayerInputHandler();

    // Called every frame
    virtual void Tick(float DeltaTime) override;

    // Called when the game starts or when spawned
    virtual void BeginPlay() override;

protected:
    // Setup input bindings
    void SetupInputBindings();
    
    // Movement functions
    UFUNCTION()
    void MoveForward(float Value);

    UFUNCTION()
    void MoveRight(float Value);

    // Camera functions
    UFUNCTION()
    void Turn(float Rate);

    UFUNCTION()
    void LookUp(float Rate);

    // Jump functions
    UFUNCTION()
    void Jump();

    UFUNCTION()
    void StopJumping();

    // Base turn rates for input
    float BaseTurnRate = 45.0f;
    float BaseLookUpRate = 45.0f;
};