using UnityEngine;

public class MoveForward_8927 : MonoBehaviour
{
    public float speed = 5.0f;

    void Update()
    {
        transform.Translate(Vector3.forward * speed * Time.deltaTime);
    }
}