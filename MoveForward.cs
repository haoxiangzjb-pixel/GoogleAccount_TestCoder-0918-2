using UnityEngine;

public class MoveForward : MonoBehaviour
{
    public float speed = 5.0f; // Speed of movement

    void Update()
    {
        transform.Translate(Vector3.forward * speed * Time.deltaTime);
    }
}