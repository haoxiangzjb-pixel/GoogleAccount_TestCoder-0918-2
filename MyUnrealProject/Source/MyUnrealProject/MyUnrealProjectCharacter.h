#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Character.h"
#include "MyUnrealProjectCharacter.generated.h"

UCLASS()
class MYUNREALPROJECT_API AMyUnrealProjectCharacter : public ACharacter
{
	GENERATED_BODY()

public:
	// Sets default values for this character's properties
	AMyUnrealProjectCharacter();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

public:	
	// Called every frame
	virtual void Tick(float DeltaTime) override;

	// Called to bind functionality to input
	virtual void SetupPlayerInputComponent(class UInputComponent* PlayerInputComponent) override;

	// Input mapping functions
	void MoveForward(float Value);
	void MoveRight(float Value);
	void LookUp(float Value);
	void Turn(float Value);

private:
	// References for input axis
	float ForwardInput;
	float RightInput;
};