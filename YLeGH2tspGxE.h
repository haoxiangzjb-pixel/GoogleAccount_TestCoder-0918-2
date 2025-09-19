// YLeGH2tspGxE.h
// Player Input Handler for Unreal Engine

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Character.h"
#include "YLeGH2tspGxE.generated.h"

UCLASS()
class AYLeGH2tspGxE : public ACharacter
{
    GENERATED_BODY()

public:
    // Sets default values for this character
    AYLeGH2tspGxE();

    // Called every frame
    virtual void Tick(float DeltaTime) override;

    // Called to bind functionality to input
    virtual void SetupPlayerInputComponent(class UInputComponent* PlayerInputComponent) override;

protected:
    // Called when the game starts or when spawned
    virtual void BeginPlay() override;

    // Input functions
    void MoveForward(float Value);
    void MoveRight(float Value);
    void Turn(float Rate);
    void LookUp(float Rate);

    // APawn interface
    virtual void Jump() override;
    virtual void StopJumping() override;
    // End of APawn interface

public:
    /** Base turn rate, in deg/sec. Other scaling may affect final turn rate. */
    UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category = Camera)
    float BaseTurnRate;

    /** Base look up/down rate, in deg/sec. Other scaling may affect final rate. */
    UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category = Camera)
    float BaseLookUpRate;
};