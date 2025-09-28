// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "Components/ActorComponent.h"
#include "InputMappingContext.h"
#include "PlayerInputHandler.generated.h"


UCLASS( ClassGroup=(Custom), meta=(BlueprintSpawnableComponent) )
class SNAKEGAME_API UPlayerInputHandler : public UActorComponent
{
	GENERATED_BODY()

public:
	// Sets default values for this component's properties
	UPlayerInputHandler();

protected:
	// Called when the game starts
	virtual void BeginPlay() override;

public:
	// Called every frame
	virtual void TickComponent(float DeltaTime, ELevelTick TickType, FActorComponentTickFunction* ThisTickFunction) override;

	// Function to bind input actions, requires a valid Enhanced Input Component
	UFUNCTION(BlueprintCallable)
	void SetupInputComponent(UInputComponent* PlayerInputComponent, APlayerController* PlayerController);

	// The input mapping context to be added to the player subsystem
	UPROPERTY(EditAnywhere, BlueprintReadOnly)
	class UInputMappingContext* InputMappingContext;
};