using UnityEngine;

public class Mover_7a2b9c : MonoBehaviour
{
    public float speed = 5.0f;

    void Update()
    {
        transform.Translate(Vector3.forward * speed * Time.deltaTime);
    }
}