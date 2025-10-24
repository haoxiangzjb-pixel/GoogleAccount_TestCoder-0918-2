#pragma once

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "PlayerInputHandler.generated.h"

/**
 * APlayerInputHandler - A PlayerController class that handles player input in Unreal Engine
 */
UCLASS()
class APlayerInputHandler : public APlayerController
{
GENERATED_BODY()

public:
APlayerInputHandler();

protected:
virtual void SetupInputComponent() override;
virtual void BeginPlay() override;

private:
// Input functions
void MoveForward(float Value);
void MoveRight(float Value);
void LookUp(float Value);
void Turn(float Value);
void Jump();

// Input mapping context and action bindings
UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Input")
class UInputMappingContext* DefaultMappingContext;

UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Input")
class UInputAction* MoveForwardAction;

UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Input")
class UInputAction* MoveRightAction;

UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Input")
class UInputAction* LookUpAction;

UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Input")
class UInputAction* TurnAction;

UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Input")
class UInputAction* JumpAction;
};
