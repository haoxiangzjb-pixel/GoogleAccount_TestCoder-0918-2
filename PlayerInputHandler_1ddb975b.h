// PlayerInputHandler_1ddb975b.h
// A custom class for handling player input in Unreal Engine

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Character.h"
#include "PlayerInputHandler_1ddb975b.generated.h"

UCLASS()
class APlayerInputHandler_1ddb975b : public ACharacter
{
    GENERATED_BODY()

public:
    // Sets default values for this character's properties
    APlayerInputHandler_1ddb975b();

    // Called every frame
    virtual void Tick(float DeltaTime) override;

    // Called when the game starts or when spawned
    virtual void BeginPlay() override;

protected:
    // Called to bind functionality to input
    virtual void SetupPlayerInputComponent(class UInputComponent* PlayerInputComponent) override;

    // Input functions
    void MoveForward(float Value);
    void MoveRight(float Value);
    void Turn(float Rate);
    void LookUp(float Rate);
    void Jump();
    void StopJumping();

    // Base turn rates for input sensitivity
    UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category = Camera)
    float BaseTurnRate = 45.0f;

    UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category = Camera)
    float BaseLookUpRate = 45.0f;
};