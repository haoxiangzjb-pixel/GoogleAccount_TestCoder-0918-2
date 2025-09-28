#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Character.h"
#include "PlayerInputHandler.generated.h"

UCLASS()
class MYGAME_API APlayerInputHandler : public ACharacter
{
	GENERATED_BODY()

public:
	// Sets default values for this character's properties
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
	void LookUp(float Value);
	void Turn(float Value);

private:
	// Movement vectors
 FVector MovementInput;
 FVector2D MouseLookInput;

 // Whether the 'Run' action is pressed
 bool bIsRunning;
};