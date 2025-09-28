#include "PlayerInputHandler.h"
#include "GameFramework/SpringArmComponent.h"
#include "Camera/CameraComponent.h"
#include "Components/InputComponent.h"

// Sets default values
APlayerInputHandler::APlayerInputHandler()
{
 	// Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;

	// Create the Spring Arm and Camera components
	SpringArm = CreateDefaultSubobject<USpringArmComponent>(TEXT("SpringArm"));
	SpringArm->SetupAttachment(RootComponent);
	SpringArm->bUsePawnControlRotation = true; // Rotate the arm based on the controller

	Camera = CreateDefaultSubobject<UCameraComponent>(TEXT("Camera"));
	Camera->SetupAttachment(SpringArm, USpringArmComponent::SocketName);
	Camera->bUsePawnControlRotation = false; // Camera does not rotate when the controller rotates
}

// Called when the game starts or when spawned
void APlayerInputHandler::BeginPlay()
{
	Super::BeginPlay();
	
}

// Called every frame
void APlayerInputHandler::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

	// Perform movement based on the accumulated input
	AddMovementInput(MovementInput.GetSafeNormal() * DeltaTime * 100.0f);

	// Perform look up/down based on mouse input
	AddControllerPitchInput(MouseLookInput.Y);

	// Perform turn left/right based on mouse input
	AddControllerYawInput(MouseLookInput.X);

	// Reset mouse look input for the next frame
	MouseLookInput = FVector2D::ZeroVector;
}

// Called to bind functionality to input
void APlayerInputHandler::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
	Super::SetupPlayerInputComponent(PlayerInputComponent);

	// Bind axis mappings
	PlayerInputComponent->BindAxis("MoveForward", this, &APlayerInputHandler::MoveForward);
	PlayerInputComponent->BindAxis("MoveRight", this, &APlayerInputHandler::MoveRight);
	PlayerInputComponent->BindAxis("LookUp", this, &APlayerInputHandler::LookUp);
	PlayerInputComponent->BindAxis("Turn", this, &APlayerInputHandler::Turn);

	// Example action mapping for running
	// PlayerInputComponent->BindAction("Run", IE_Pressed, this, &APlayerInputHandler::StartRunning);
	// PlayerInputComponent->BindAction("Run", IE_Released, this, &APlayerInputHandler::StopRunning);
}

void APlayerInputHandler::MoveForward(float Value)
{
	if (Value != 0.0f)
	{
		MovementInput.X = Value;
	}
}

void APlayerInputHandler::MoveRight(float Value)
{
	if (Value != 0.0f)
	{
		MovementInput.Y = Value;
	}
}

void APlayerInputHandler::LookUp(float Value)
{
	// Accumulate mouse look input
	MouseLookInput.Y = Value;
}

void APlayerInputHandler::Turn(float Value)
{
	// Accumulate mouse look input
	MouseLookInput.X = Value;
}

// Example action functions
// void APlayerInputHandler::StartRunning()
// {
// 	bIsRunning = true;
// }
//
// void APlayerInputHandler::StopRunning()
// {
// 	bIsRunning = false;
// }