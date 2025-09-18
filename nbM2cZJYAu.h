// nbM2cZJYAu.h
// Player input handler class for Unreal Engine

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Pawn.h"
#include "nbM2cZJYAu.generated.h"

UCLASS()
class ANbM2cZJYAu : public APawn
{
	GENERATED_BODY()

public:
	// Sets default values for this pawn's properties
	ANbM2cZJYAu();

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

	// Player input variables
	UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Input")
	float BaseTurnRate = 45.0f;

	UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Input")
	float BaseLookUpRate = 45.0f;

private:
	bool bPressedJump;
};