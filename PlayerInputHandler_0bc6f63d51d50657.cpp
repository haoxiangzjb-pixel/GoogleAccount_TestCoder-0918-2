// PlayerInputHandler_0bc6f63d51d50657.cpp
// Unreal Engine C++ Class for handling player input

#include "CoreMinimal.h"
#include "GameFramework/Pawn.h"
#include "GameFramework/InputSettings.h"
#include "Components/InputComponent.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"
#include "InputActionValue.h"
#include "PlayerInputHandler.generated.h"

UCLASS()
class APlayerInputHandler : public APawn
{
	GENERATED_BODY()

public:
	// Sets default values for this pawn's properties
	APlayerInputHandler();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

public:	
	// Called every frame
	virtual void Tick(float DeltaTime) override;

	// Called to bind functionality to input
	virtual void SetupPlayerInputComponent(class UInputComponent* PlayerInputComponent) override;

private:
	// Input Actions
	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Input")
	class UInputAction* MoveAction;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Input")
	class UInputAction* LookAction;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Input")
	class UInputAction* JumpAction;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Input")
	class UInputAction* SprintAction;

	// Input mapping context
	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Input")
	class UInputMappingContext* DefaultMappingContext;

	// Movement variables
	float MoveSpeed;
	float SprintMultiplier;
	float LookSensitivity;

	// Input handlers
	void HandleMove(const FInputActionValue& Value);
	void HandleLook(const FInputActionValue& Value);
	void HandleJump(const FInputActionValue& Value);
	void HandleSprint(const FInputActionValue& Value);
};

// Constructor
APlayerInputHandler::APlayerInputHandler()
{
	// Set this pawn to call Tick() every frame
	PrimaryActorTick.bCanEverTick = true;

	// Initialize movement variables
	MoveSpeed = 600.0f;
	SprintMultiplier = 2.0f;
	LookSensitivity = 1.0f;

	// Create default root component
	USceneComponent* RootSceneComponent = CreateDefaultSubobject<USceneComponent>(TEXT("RootSceneComponent"));
	SetRootComponent(RootSceneComponent);
}

void APlayerInputHandler::BeginPlay()
{
	Super::BeginPlay();

	// Get Enhanced Input Subsystem
	if (APlayerController* PlayerController = Cast<APlayerController>(GetController()))
	{
		if (ULocalPlayer* LocalPlayer = PlayerController->GetLocalPlayer())
		{
			if (UEnhancedInputLocalPlayerSubsystem* Subsystem = ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(LocalPlayer))
			{
				if (DefaultMappingContext)
				{
					// Add the mapping context with highest priority
					Subsystem->AddMappingContext(DefaultMappingContext, 1);
				}
			}
		}
	}
}

void APlayerInputHandler::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);
}

void APlayerInputHandler::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
	Super::SetupPlayerInputComponent(PlayerInputComponent);

	// Set up action bindings using Enhanced Input
	if (UEnhancedInputComponent* EnhancedInputComponent = Cast<UEnhancedInputComponent>(PlayerInputComponent))
	{
		// Moving
		if (MoveAction)
		{
			EnhancedInputComponent->BindAction(MoveAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::HandleMove);
		}

		// Looking
		if (LookAction)
		{
			EnhancedInputComponent->BindAction(LookAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::HandleLook);
		}

		// Jumping
		if (JumpAction)
		{
			EnhancedInputComponent->BindAction(JumpAction, ETriggerEvent::Started, this, &APlayerInputHandler::HandleJump);
			EnhancedInputComponent->BindAction(JumpAction, ETriggerEvent::Completed, this, &APlayerInputHandler::HandleJump);
		}

		// Sprinting
		if (SprintAction)
		{
			EnhancedInputComponent->BindAction(SprintAction, ETriggerEvent::Started, this, &APlayerInputHandler::HandleSprint);
			EnhancedInputComponent->BindAction(SprintAction, ETriggerEvent::Completed, this, &APlayerInputHandler::HandleSprint);
		}
	}
}

void APlayerInputHandler::HandleMove(const FInputActionValue& Value)
{
	// Input is a Vector2D
	FVector2D MovementVector = Value.Get<FVector2D>();

	if (Controller != nullptr)
	{
		// Find out which way is forward
		const FRotator Rotation = Controller->GetControlRotation();
		const FRotator YawRotation(0, Rotation.Yaw, 0);

		// Get forward and right vectors
		const FVector ForwardDirection = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);
		const FVector RightDirection = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);

		// Apply movement with optional sprint
		float CurrentSpeed = MoveSpeed;
		if (SprintAction && /* Check if sprint is active */ false)
		{
			CurrentSpeed *= SprintMultiplier;
		}

		AddMovementInput(ForwardDirection, MovementVector.Y * CurrentSpeed);
		AddMovementInput(RightDirection, MovementVector.X * CurrentSpeed);
	}
}

void APlayerInputHandler::HandleLook(const FInputActionValue& Value)
{
	// Input is a Vector2D
	FVector2D LookAxisVector = Value.Get<FVector2D>();

	if (Controller != nullptr)
	{
		// Add yaw and pitch input to controller
		AddControllerYawInput(LookAxisVector.X * LookSensitivity);
		AddControllerPitchInput(LookAxisVector.Y * LookSensitivity);
	}
}

void APlayerInputHandler::HandleJump(const FInputActionValue& Value)
{
	// Toggle jump on/off based on value
	bool bIsJumping = Value.Get<bool>();
	
	if (bIsJumping)
	{
		Jump();
	}
	else
	{
		StopJumping();
	}
}

void APlayerInputHandler::HandleSprint(const FInputActionValue& Value)
{
	// Handle sprint toggle logic here
	// This is a placeholder for sprint functionality
	bool bIsSprinting = Value.Get<bool>();
	
	// You can implement custom sprint logic here
	// For example, setting a flag or modifying movement speed
}
