// PlayerInputHandler.cpp
// A C++ class for handling player input in Unreal Engine

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "GameFramework/Pawn.h"
#include "GameFramework/Character.h"
#include "PlayerInputHandler.h"

// Constructor
APlayerInputHandler::APlayerInputHandler()
{
    // Set this actor to call Tick() every frame. You can turn this off to improve performance if you don't need it.
    PrimaryActorTick.bCanEverTick = true;
}

// Called when the game starts or when spawned
void APlayerInputHandler::BeginPlay()
{
    Super::BeginPlay();
    
    // Setup input bindings
    SetupInputBindings();
}

// Called every frame
void APlayerInputHandler::Tick(float DeltaTime)
{
    Super::Tick(DeltaTime);
}

// Setup input bindings
void APlayerInputHandler::SetupInputBindings()
{
    // Get the player controller
    APlayerController* PlayerController = GetWorld()->GetFirstPlayerController();
    if (PlayerController)
    {
        // Bind input actions
        PlayerController->InputComponent->BindAxis("MoveForward", this, &APlayerInputHandler::MoveForward);
        PlayerController->InputComponent->BindAxis("MoveRight", this, &APlayerInputHandler::MoveRight);
        PlayerController->InputComponent->BindAxis("Turn", this, &APlayerInputHandler::Turn);
        PlayerController->InputComponent->BindAxis("LookUp", this, &APlayerInputHandler::LookUp);
        
        PlayerController->InputComponent->BindAction("Jump", IE_Pressed, this, &APlayerInputHandler::Jump);
        PlayerController->InputComponent->BindAction("Jump", IE_Released, this, &APlayerInputHandler::StopJumping);
    }
}

// Movement functions
void APlayerInputHandler::MoveForward(float Value)
{
    if (Value != 0.0f)
    {
        // Find the player character
        ACharacter* PlayerCharacter = UGameplayStatics::GetPlayerCharacter(GetWorld(), 0);
        if (PlayerCharacter)
        {
            // Add movement in the forward direction
            FVector Direction = PlayerCharacter->GetActorForwardVector();
            PlayerCharacter->AddMovementInput(Direction, Value);
        }
    }
}

void APlayerInputHandler::MoveRight(float Value)
{
    if (Value != 0.0f)
    {
        // Find the player character
        ACharacter* PlayerCharacter = UGameplayStatics::GetPlayerCharacter(GetWorld(), 0);
        if (PlayerCharacter)
        {
            // Add movement in the right direction
            FVector Direction = PlayerCharacter->GetActorRightVector();
            PlayerCharacter->AddMovementInput(Direction, Value);
        }
    }
}

// Camera functions
void APlayerInputHandler::Turn(float Rate)
{
    // Calculate delta for this frame from the rate information
    AddControllerYawInput(Rate * BaseTurnRate * GetWorld()->GetDeltaSeconds());
}

void APlayerInputHandler::LookUp(float Rate)
{
    // Calculate delta for this frame from the rate information
    AddControllerPitchInput(Rate * BaseLookUpRate * GetWorld()->GetDeltaSeconds());
}

// Jump functions
void APlayerInputHandler::Jump()
{
    ACharacter* PlayerCharacter = UGameplayStatics::GetPlayerCharacter(GetWorld(), 0);
    if (PlayerCharacter)
    {
        PlayerCharacter->Jump();
    }
}

void APlayerInputHandler::StopJumping()
{
    ACharacter* PlayerCharacter = UGameplayStatics::GetPlayerCharacter(GetWorld(), 0);
    if (PlayerCharacter)
    {
        PlayerCharacter->StopJumping();
    }
}