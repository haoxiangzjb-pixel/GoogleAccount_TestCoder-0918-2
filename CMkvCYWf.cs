using UnityEngine;

public class MoveForward : MonoBehaviour
{
    [SerializeField] private float speed = 5.0f; // Speed of movement
    private Rigidbody rb;

    void Start()
    {
        rb = GetComponent<Rigidbody>();
    }

    void Update()
    {
        // Move the object forward in its local Z direction
        transform.Translate(Vector3.forward * speed * Time.deltaTime);
    }

    // Alternative method using Rigidbody for physics-based movement
    void FixedUpdate()
    {
        if (rb != null)
        {
            rb.velocity = transform.forward * speed;
        }
    }
}