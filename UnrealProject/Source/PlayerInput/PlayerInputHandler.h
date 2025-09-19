// PlayerInputHandler.h
// Header file for the Player Input Handler class in Unreal Engine

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Pawn.h"
#include "PlayerInputHandler.generated.h"

UCLASS()
class APlayerInputHandler : public APawn
{
    GENERATED_BODY()

public:
    // Constructor
    APlayerInputHandler();

protected:
    // Called when the game starts or when spawned
    virtual void BeginPlay() override;

    // Setup input bindings
    virtual void SetupPlayerInputComponent();

public:
    // Called every frame
    virtual void Tick(float DeltaTime) override;

    // Input variables
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Input")
    float BaseTurnRate;

    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Input")
    float BaseLookUpRate;

    // Input functions
    UFUNCTION()
    void Jump();

    UFUNCTION()
    void MoveForward(float Value);

    UFUNCTION()
    void Turn(float Rate);

    UFUNCTION()
    void LookUp(float Rate);
};