\newpage

# Sobriety: Vibration-free

## Platform

|   OS          |  OS version  |  Langage  |
|---------------|--------------|-----------|
| Android       |      -       |  Java     |

## Main caracteristics

|   ID     | Title                 | Category    | Sub-category   |
|----------|-----------------------|-------------|----------------|
| ESOB011  | Vibration-free        | Environment | Sobriety       |

## Severity / Remediation Cost

|  Severity  | Remediation Cost |
|------------|------------------|
| Minor      | Trivial          |

## Rule short description

Avoid using the device vibrator to use less energy.

## Rule complete description

## Text

Shaking of an Android device is possible in all circumstances with a call to\
getSystemService(Context.VIBRATOR_SERVICE) (API 26) or\
getSystemService(Context.VIBRATOR_MANAGER_SERVICE) (API 31).\
Behind this effect stands a specific miniature hardware component, motor or actuator, that consumes power.\
As a consequence, its usage must be discouraged, especially since its added value is not clear.

## HTML

```html
<p>Shaking of an Android device is possible in all circumstances with a call to <code>getSystemService(Context.VIBRATOR_SERVICE)</code> (API 26) or
 <code>getSystemService(Context.VIBRATOR.MANAGER.SERVICE)</code> (API 31).
 Behind this effect stands a specific miniature hardware component, motor or actuator, that consumes power.
 As a consequence, its usage must be discouraged, especially since its added value is not clear.</p>
<h2>Noncompliant Code Example</h2>
API 26:
<pre>
  Vibrator v = (Vibrator) getSystemService(Context.VIBRATOR_SERVICE);
  v.vibrate(400);
</pre>
API 31:
<pre>
  VibratorManager vm = (VibratorManager) getSystemService(Context.VIBRATOR_MANAGER_SERVICE);
  vm.getDefaultVibrator().vibrate(VibrationEffect.createOneShot(500, VibrationEffect.DEFAULT_AMPLITUDE));
</pre>
```

## Implementation principle

- On the method `android.content.Context#getSystemService(String)` or\
 `android.app.Activity#getSystemService(String)`, checks that they are not called\
  with parameter value `Context.VIBRATOR_SERVICE ("vibrator")` or\
  `Context.VIBRATOR_MANAGER_SERVICE ("vibrator_manager")`
