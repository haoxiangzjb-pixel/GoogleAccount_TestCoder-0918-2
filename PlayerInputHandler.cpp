// Fill out your copyright notice in the Description page of Project Settings.

#include "PlayerInputHandler.h"
#include "Engine/Engine.h"
#include "GameFramework/PlayerController.h"
#include "Components/InputComponent.h"


// Sets default values
APlayerInputHandler::APlayerInputHandler()
{
 	// Set this actor to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;
}

// Called when the game starts or when spawned
void APlayerInputHandler::BeginPlay()
{
	Super::BeginPlay();
	
	// Initialize input handling
	InitializeInput();
}

// Called every frame
void APlayerInputHandler::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

}

// Called to bind functionality to input
void APlayerInputHandler::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
	Super::SetupPlayerInputComponent(PlayerInputComponent);

	// Bind movement input
	PlayerInputComponent->BindAxis(TEXT("MoveForward"), this, &APlayerInputHandler::MoveForward);
	PlayerInputComponent->BindAxis(TEXT("MoveRight"), this, &APlayerInputHandler::MoveRight);

	// Bind action input
	PlayerInputComponent->BindAction(TEXT("Jump"), IE_Pressed, this, &APlayerInputHandler::Jump);
	PlayerInputComponent->BindAction(TEXT("Fire"), IE_Pressed, this, &APlayerInputHandler::Fire);
}

void APlayerInputHandler::InitializeInput()
{
	// Additional input initialization code can go here
	if (GEngine)
	{
		GEngine->AddOnScreenDebugMessage(-1, 5.0f, FColor::Green, TEXT("Player Input Handler Initialized"));
	}
}

void APlayerInputHandler::MoveForward(float Value)
{
	if (Value != 0.0f)
	{
		// Add forward movement logic here
		AddMovementInput(GetActorForwardVector(), Value);
	}
}

void APlayerInputHandler::MoveRight(float Value)
{
	if (Value != 0.0f)
	{
		// Add right movement logic here
		AddMovementInput(GetActorRightVector(), Value);
	}
}

void APlayerInputHandler::Jump()
{
	// Add jump logic here
	if (GEngine)
	{
		GEngine->AddOnScreenDebugMessage(-1, 1.0f, FColor::Blue, TEXT("Jump pressed"));
	}
}

void APlayerInputHandler::Fire()
{
	// Add fire logic here
	if (GEngine)
	{
		GEngine->AddOnScreenDebugMessage(-1, 1.0f, FColor::Red, TEXT("Fire pressed"));
	}
}