#pragma once

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "KF9j2nR8pQvL.generated.h"

/**
 * A custom player controller class that handles player input in Unreal Engine
 */
UCLASS()
class AKF9j2nR8pQvL : public APlayerController
{
	GENERATED_BODY()

public:
	// Sets default values for this character's properties
	AKF9j2nR8pQvL();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

public:	
	// Called every frame
	virtual void Tick(float DeltaTime) override;

	// Called to bind functionality to input
	virtual void SetupInputComponent() override;

	// Input functions
	void MoveForward(float Value);
	void MoveRight(float Value);
	void LookUp(float Value);
	void Turn(float Value);
	void Jump();
	void Fire();

private:
	// Variables to store movement input
	float ForwardInputValue;
	float RightInputValue;

	// Input mapping context
	UPROPERTY()
	class UInputMappingContext* DefaultMappingContext;

	// Input action references
	UPROPERTY()
	class UInputAction* MoveForwardAction;
	UPROPERTY()
	class UInputAction* MoveRightAction;
	UPROPERTY()
	class UInputAction* LookUpAction;
	UPROPERTY()
	class UInputAction* TurnAction;
	UPROPERTY()
	class UInputAction* JumpAction;
	UPROPERTY()
	class UInputAction* FireAction;
};