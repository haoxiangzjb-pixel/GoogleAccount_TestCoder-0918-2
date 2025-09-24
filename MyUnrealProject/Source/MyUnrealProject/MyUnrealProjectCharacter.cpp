#include "MyUnrealProjectCharacter.h"
#include "GameFramework/CharacterMovementComponent.h"
#include "Camera/CameraComponent.h"
#include "Components/InputComponent.h"

// Sets default values
AMyUnrealProjectCharacter::AMyUnrealProjectCharacter()
{
 	// Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;

	// Create and configure the camera boom
	CameraBoom = CreateDefaultSubobject<USpringArmComponent>(TEXT("CameraBoom"));
	CameraBoom->SetupAttachment(RootComponent);
	CameraBoom->bUsePawnControlRotation = true; // Rotate the arm based on the controller

	// Create and configure the follow camera
	FollowCamera = CreateDefaultSubobject<UCameraComponent>(TEXT("FollowCamera"));
	FollowCamera->SetupAttachment(CameraBoom, USpringArmComponent::SocketName);
	FollowCamera->bUsePawnControlRotation = false; // Camera does not rotate with the controller
}

// Called when the game starts or when spawned
void AMyUnrealProjectCharacter::BeginPlay()
{
	Super::BeginPlay();
	
}

// Called every frame
void AMyUnrealProjectCharacter::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

}

// Called to bind functionality to input
void AMyUnrealProjectCharacter::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
	Super::SetupPlayerInputComponent(PlayerInputComponent);

	// Bind axis mappings
	PlayerInputComponent->BindAxis("MoveForward", this, &AMyUnrealProjectCharacter::MoveForward);
	PlayerInputComponent->BindAxis("MoveRight", this, &AMyUnrealProjectCharacter::MoveRight);
	PlayerInputComponent->BindAxis("LookUp", this, &AMyUnrealProjectCharacter::LookUp);
	PlayerInputComponent->BindAxis("Turn", this, &AMyUnrealProjectCharacter::Turn);
}

// Input mapping functions
void AMyUnrealProjectCharacter::MoveForward(float Value)
{
	AddMovementInput(GetActorForwardVector(), Value);
}

void AMyUnrealProjectCharacter::MoveRight(float Value)
{
	AddMovementInput(GetActorRightVector(), Value);
}

void AMyUnrealProjectCharacter::LookUp(float Value)
{
	AddControllerPitchInput(Value);
}

void AMyUnrealProjectCharacter::Turn(float Value)
{
	AddControllerYawInput(Value);
}