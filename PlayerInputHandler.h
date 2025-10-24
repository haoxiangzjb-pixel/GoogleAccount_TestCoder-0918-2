#pragma once

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "PlayerInputHandler.generated.h"

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
	void Shoot();

	// Movement variables
	float MoveForwardValue;
	float MoveRightValue;
};