// PlayerInputHandler.h
// A C++ class for handling player input in Unreal Engine

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Pawn.h"
#include "PlayerInputHandler.generated.h"

UCLASS()
class APlayerInputHandler : public APawn
{
	GENERATED_BODY()

public:
	// Sets default values for this pawn's properties
	APlayerInputHandler();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

public:	
	// Called every frame
	virtual void Tick(float DeltaTime) override;

	// Called to bind functionality to input
	virtual void SetupPlayerInputComponent(class UInputComponent* PlayerInputComponent) override;

	// Input functions
	void MoveForward(float Value);
	void MoveRight(float Value);
	void Turn(float Rate);
	void LookUp(float Rate);
	void Jump();
	void StopJumping();

private:
	// Player input variables
	float BaseTurnRate = 45.0f;
	float BaseLookUpRate = 45.0f;
	bool bPressedJump = false;
};