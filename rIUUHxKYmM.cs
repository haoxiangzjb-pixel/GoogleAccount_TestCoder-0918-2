using UnityEngine;

public class MoveForward : MonoBehaviour
{
    public float speed = 5.0f;
    
    void Update()
    {
        // Move the object forward along its local Z-axis
        transform.Translate(Vector3.forward * speed * Time.deltaTime);
    }
}