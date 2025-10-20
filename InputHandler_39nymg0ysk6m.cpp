// Fill out your copyright notice in the Description page of Project Settings.

#include "InputHandler_39nymg0ysk6m.h"
#include "Engine/Engine.h"
#include "GameFramework/PlayerController.h"
#include "Components/InputComponent.h"


// Sets default values
AInputHandler_39nymg0ysk6m::AInputHandler_39nymg0ysk6m()
{
 	// Set this actor to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;
}

// Called when the game starts or when spawned
void AInputHandler_39nymg0ysk6m::BeginPlay()
{
	Super::BeginPlay();
	
	// Initialize input handling
	InitializeInput();
}

// Called every frame
void AInputHandler_39nymg0ysk6m::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

}

// Called to bind functionality to input
void AInputHandler_39nymg0ysk6m::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
	Super::SetupPlayerInputComponent(PlayerInputComponent);

	// Bind movement input
	PlayerInputComponent->BindAxis(TEXT("MoveForward"), this, &AInputHandler_39nymg0ysk6m::MoveForward);
	PlayerInputComponent->BindAxis(TEXT("MoveRight"), this, &AInputHandler_39nymg0ysk6m::MoveRight);

	// Bind action input
	PlayerInputComponent->BindAction(TEXT("Jump"), IE_Pressed, this, &AInputHandler_39nymg0ysk6m::Jump);
	PlayerInputComponent->BindAction(TEXT("Fire"), IE_Pressed, this, &AInputHandler_39nymg0ysk6m::Fire);
}

void AInputHandler_39nymg0ysk6m::InitializeInput()
{
	// Additional input initialization code can go here
	if (GEngine)
	{
		GEngine->AddOnScreenDebugMessage(-1, 5.0f, FColor::Green, TEXT("Player Input Handler Initialized"));
	}
}

void AInputHandler_39nymg0ysk6m::MoveForward(float Value)
{
	if (Value != 0.0f)
	{
		// Add forward movement logic here
		AddMovementInput(GetActorForwardVector(), Value);
	}
}

void AInputHandler_39nymg0ysk6m::MoveRight(float Value)
{
	if (Value != 0.0f)
	{
		// Add right movement logic here
		AddMovementInput(GetActorRightVector(), Value);
	}
}

void AInputHandler_39nymg0ysk6m::Jump()
{
	// Add jump logic here
	if (GEngine)
	{
		GEngine->AddOnScreenDebugMessage(-1, 1.0f, FColor::Blue, TEXT("Jump pressed"));
	}
}

void AInputHandler_39nymg0ysk6m::Fire()
{
	// Add fire logic here
	if (GEngine)
	{
		GEngine->AddOnScreenDebugMessage(-1, 1.0f, FColor::Red, TEXT("Fire pressed"));
	}
}