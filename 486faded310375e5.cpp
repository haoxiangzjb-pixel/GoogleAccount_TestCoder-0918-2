// Fill out your copyright notice in the Description page of Project Settings.

#include "PlayerInputHandler.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"


// Sets default values for this component's properties
UPlayerInputHandler::UPlayerInputHandler()
{
	// Set this component to be initialized when the game starts, and to be ticked every frame.  You can turn these features
	// off to improve performance if you don't need them.
	PrimaryComponentTick.bCanEverTick = true;

	// ...
}


// Called when the game starts
void UPlayerInputHandler::BeginPlay()
{
	Super::BeginPlay();

	// ...
	
}


// Called every frame
void UPlayerInputHandler::TickComponent(float DeltaTime, ELevelTick TickType, FActorComponentTickFunction* ThisTickFunction)
{
	Super::TickComponent(DeltaTime, TickType, ThisTickFunction);

	// ...
}

void UPlayerInputHandler::SetupInputComponent(UInputComponent* PlayerInputComponent, APlayerController* PlayerController)
{
	// Ensure the input component is valid
	if (!PlayerInputComponent || !PlayerController)
	{
		return;
	}

	// Cast to EnhancedInputComponent
	UEnhancedInputComponent* EnhancedInputComponent = Cast<UEnhancedInputComponent>(PlayerInputComponent);
	if (!EnhancedInputComponent)
	{
		// Log an error if the cast fails
		UE_LOG(LogTemp, Error, TEXT("UPlayerInputHandler::SetupInputComponent: Input component is not an Enhanced Input Component!"));
		return;
	}

	// Get the local player subsystem
	if (UEnhancedInputLocalPlayerSubsystem* Subsystem = ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(PlayerController->GetLocalPlayer()))
	{
		// Add the mapping context so the input component responds to inputs
		Subsystem->AddMappingContext(InputMappingContext, 0);
	}
}
