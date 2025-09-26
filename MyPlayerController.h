#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Character.h"
#include "MyPlayerController.generated.h"

UCLASS()
class MYGAME_API AMyPlayerController : public ACharacter
{
	GENERATED_BODY()

public:
	// Sets default values for this character's properties
	AMyPlayerController();

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
	// Variables for input
	float MoveForwardValue;
	float MoveRightValue;
	float LookUpValue;
	float TurnValue;
};