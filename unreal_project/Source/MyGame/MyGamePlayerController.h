#pragma once

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "MyGamePlayerController.generated.h"

UCLASS()
class MYGAME_API AMyGamePlayerController : public APlayerController
{
	GENERATED_BODY()

public:
	AMyGamePlayerController();

protected:
	virtual void SetupInputComponent() override;

public:
	virtual void Tick(float DeltaTime) override;

	// Example input functions
	void MoveForward(float Value);
	void MoveRight(float Value);
	void LookUp(float Value);
	void Turn(float Value);
	void Jump();

	// Example variables to store input values
	float MoveForwardValue;
	float MoveRightValue;
	float LookUpValue;
	float TurnValue;
};