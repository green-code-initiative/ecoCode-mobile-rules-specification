\newpage

# Sobriety: Torch-free

## Platform

|   OS          |  OS version  |  Langage  |
|---------------|--------------|-----------|
| Android       |      -       |  Java     |

## Main caracteristics

|   ID     | Title                 | Category    | Sub-category   |
|----------|-----------------------|-------------|----------------|
| ESOB013  | Torch-free            | Environment | Sobriety       |

## Severity / Remediation Cost

|  Severity  | Remediation Cost |
|------------|------------------|
| Major      | Trivial          |

## Rule short description

Flashlight is one of the most energy-intensive component. Don't programmatically turn it on.

## Rule complete description

## Text

Turning on the torch mode programmatically with`CameraManager#setTorchMode(..., true)`must absolutely be
avoided because the flashlight is one of the most energy-intensive component.

## HTML

```html
<p>Turning on the torch mode programmatically with <code>CameraManager#setTorchMode(..., true)</code> must absolutely be
    avoided because the flashlight is one of the most energy-intensive component.</p>
<h2>Noncompliant Code Example</h2>
<pre>
 CameraManager camManager = (CameraManager) getSystemService(Context.CAMERA_SERVICE);
        String cameraId = null;
        try {
            cameraId = camManager.getCameraIdList()[0];
            camManager.setTorchMode(cameraId, true);
        } catch (CameraAccessException e) {
            e.printStackTrace();
        }
</pre> 
```

## Implementation principle

- On the method `android.hardware.camera2.CameraManager.setTorchMode(String,boolean)`, check that the second parameter is set to `true`
  