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

private:
	// Input mappings
	float MoveForwardAxisValue;
	float MoveRightAxisValue;
	float LookUpAxisValue;
	float TurnAxisValue;
};