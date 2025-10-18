#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Character.h"
#include "7pYUVOBHxhEz.generated.h"

UCLASS()
class A7pYUVOBHxhEz : public ACharacter
{
	GENERATED_BODY()

public:
	// Sets default values for this character's properties
	A7pYUVOBHxhEz();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

public:	
	// Called every frame
	virtual void Tick(float DeltaTime) override;

	// Called to bind functionality to input
	virtual void SetupPlayerInputComponent(class UInputComponent* PlayerInputComponent) override;

	// Movement functions
	void MoveForward(float Value);
	void MoveRight(float Value);

	// Look functions
	void LookUp(float Value);
	void Turn(float Value);

private:
	// Variables to store movement input
	float ForwardInputValue;
	float RightInputValue;

	// Camera components
	UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category = Camera, meta = (AllowPrivateAccess = "true"))
	class USpringArmComponent* CameraBoom;

	UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category = Camera, meta = (AllowPrivateAccess = "true"))
	class UCameraComponent* FollowCamera;
};