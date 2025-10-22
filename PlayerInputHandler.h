#pragma once

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "PlayerInputHandler.generated.h"

/**
 * APlayerInputHandler - Handles player input for Unreal Engine games
 */
UCLASS()
class APlayerInputHandler : public APlayerController
{
	GENERATED_BODY()

public:
	APlayerInputHandler();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

	// Input binding functions
	void SetupInputBindings();

	// Movement input functions
	void MoveForward(float Value);
	void MoveRight(float Value);

	// Action input functions
	void Jump();
	void Fire();

private:
	// Input mapping context
	UPROPERTY()
	class UInputMappingContext* InputMappingContext;

	UPROPERTY()
	class UInputAction* MoveForwardAction;

	UPROPERTY()
	class UInputAction* MoveRightAction;

	UPROPERTY()
	class UInputAction* JumpAction;

	UPROPERTY()
	class UInputAction* FireAction;
};