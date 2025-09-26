#pragma once

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "MyPlayerController.generated.h"

/**
 * 
 */
UCLASS()
class MYGAME_API AMyPlayerController : public APlayerController
{
	GENERATED_BODY()

public:
	/** Handles input for moving forward/back */
	void MoveForward(float Value);

	/** Handles input for moving right/left */
	void MoveRight(float Value);

	/** Handles the jump action */
	void Jump();

	/** Handles the fire action */
	void Fire();

protected:
	/** Binds callbacks for input axes and actions */
	virtual void SetupInputComponent() override;

private:
	/** Input mapping context */
	UPROPERTY(EditDefaultsOnly, BlueprintReadOnly, Category = Input)
	class UInputMappingContext* DefaultMappingContext;

	/** Move Forward/Back Input Action */
	UPROPERTY(EditDefaultsOnly, BlueprintReadOnly, Category = Input)
	class UInputAction* MoveForwardAction;

	/** Move Right/Left Input Action */
	UPROPERTY(EditDefaultsOnly, BlueprintReadOnly, Category = Input)
	class UInputAction* MoveRightAction;

	/** Jump Input Action */
	UPROPERTY(EditDefaultsOnly, BlueprintReadOnly, Category = Input)
	class UInputAction* JumpAction;

	/** Fire Input Action */
	UPROPERTY(EditDefaultsOnly, BlueprintReadOnly, Category = Input)
	class UInputAction* FireAction;
};