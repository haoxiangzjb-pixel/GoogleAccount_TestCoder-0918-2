#include "MyPlayerController_73a2b.h"
#include "Engine/World.h"

// Sets default values
AMyPlayerController_73a2b::AMyPlayerController_73a2b()
{
    // Don't call Tick() every frame
    PrimaryActorTick.bCanEverTick = false;
}

// Called when the game starts or when spawned
void AMyPlayerController_73a2b::BeginPlay()
{
    Super::BeginPlay();
    
    // Enable input for this controller
    if (InputComponent)
    {
        // Bind input actions
        InputComponent->BindAction("Jump", IE_Pressed, this, &AMyPlayerController_73a2b::Jump);
        InputComponent->BindAction("MoveForward", IE_Pressed, this, &AMyPlayerController_73a2b::MoveForward);
        InputComponent->BindAxis("Turn", this, &AMyPlayerController_73a2b::Turn);
    }
}

// Example input handling functions
void AMyPlayerController_73a2b::Jump()
{
    // Add jump logic here
    UE_LOG(LogTemp, Log, TEXT("Jump input received!"));
}

void AMyPlayerController_73a2b::MoveForward(float Value)
{
    // Add forward movement logic here
    UE_LOG(LogTemp, Log, TEXT("Move Forward input received: %f"), Value);
}

void AMyPlayerController_73a2b::Turn(float Value)
{
    // Add turning logic here
    UE_LOG(LogTemp, Log, TEXT("Turn input received: %f"), Value);
}