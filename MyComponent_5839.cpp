#include "MyComponent_5839.h"
#include "Engine/Engine.h"
#include "GameFramework/Character.h"
#include "GameFramework/PlayerController.h"

// Sets default values for this component's properties
UMyComponent_5839::UMyComponent_5839()
{
	// Set this component to be initialized when the game starts, and to be ticked every frame.  You can turn these features
	// off to improve performance if you don't need them.
	PrimaryComponentTick.bCanEverTick = true;

	// ...
}


// Called when the game starts
void UMyComponent_5839::BeginPlay()
{
	Super::BeginPlay();

	// ...
	
}


// Called every frame
void UMyComponent_5839::TickComponent(float DeltaTime, ELevelTick TickType, FActorComponentTickFunction* ThisTickFunction)
{
	Super::TickComponent(DeltaTime, TickType, ThisTickFunction);

	// ...
}

void UMyComponent_5839::SetupInputBinding()
{
	// Get the owner character and player controller
	ACharacter* CharacterOwner = Cast<ACharacter>(GetOwner());
	if (CharacterOwner && CharacterOwner->GetController())
	{
		PlayerControllerRef = Cast<APlayerController>(CharacterOwner->GetController());

		if (PlayerControllerRef)
		{
			// Example: Bind axis mappings from Project Settings -> Input
			PlayerControllerRef->InputComponent->BindAxis("MoveForward", this, &UMyComponent_5839::MoveForward);
			PlayerControllerRef->InputComponent->BindAxis("MoveRight", this, &UMyComponent_5839::MoveRight);

			// Example: Bind action mappings
			PlayerControllerRef->InputComponent->BindAction("Jump", IE_Pressed, this, &UMyComponent_5839::Jump);
		}
	}
}

void UMyComponent_5839::MoveForward(float Value)
{
	if (PlayerControllerRef)
	{
		// Get the owning character to apply movement
		ACharacter* CharacterOwner = Cast<ACharacter>(GetOwner());
		if (CharacterOwner)
		{
			// Assuming forward movement along the character's local Y-axis
			CharacterOwner->AddMovementInput(CharacterOwner->GetActorForwardVector(), Value);
		}
	}
}

void UMyComponent_5839::MoveRight(float Value)
{
	if (PlayerControllerRef)
	{
		ACharacter* CharacterOwner = Cast<ACharacter>(GetOwner());
		if (CharacterOwner)
		{
			// Assuming right movement along the character's local X-axis
			CharacterOwner->AddMovementInput(CharacterOwner->GetActorRightVector(), Value);
		}
	}
}

void UMyComponent_5839::Jump()
{
	// Example: Trigger a jump on the owning character
	ACharacter* CharacterOwner = Cast<ACharacter>(GetOwner());
	if (CharacterOwner)
	{
		CharacterOwner->Jump();
	}
}