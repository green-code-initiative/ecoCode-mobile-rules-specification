\newpage

# Sobriety: Thrifty Motion Sensor

## Platform

|   OS          |  OS version  |  Langage  |
|---------------|--------------|-----------|
| Android       |      -       |  Java     |

## Main caracteristics

|   ID     | Title                 | Category    | Sub-category   |
|----------|-----------------------|-------------|----------------|
| ESOB001  | Thrifty Motion Sensor | Environment | Sobriety       |

## Severity / Remediation Cost
  
|  Severity  | Remediation Cost    |
|------------|---------------------|
| Minor      | Trivial             |

## Rule short description

Prefer using TYPE_GEOMAGNETIC_ROTATION_VECTOR instead of TYPE_ROTATION_VECTOR to use less energy.

## Rule complete description

## Text

The rotation vector sensor is the most frequently used sensor for motion detection and monitoring.
When using `SensorManager#getDefaultSensor(int type)`, always prefer the constant `TYPE_GEOMAGNETIC_ROTATION_VECTOR`
which is similar to `TYPE_ROTATION_VECTOR`, but using a magnetometer instead of using a gyroscope. This sensor uses
lower power than the other rotation vectors, because it doesn't use the gyroscope. However, it is more noisy and will
work best outdoors.

## HTML

```html
<p>The rotation vector sensor is the most frequently used sensor for motion detection and monitoring. When using
    <code>SensorManager#getDefaultSensor(int type)</code>, always prefer the
    constant <code>TYPE_GEOMAGNETIC_ROTATION_VECTOR</code> which is similar to <code>TYPE_ROTATION_VECTOR</code>,
    but using a magnetometer instead of using a gyroscope. This sensor uses lower power than the other rotation vectors,
    because it doesn't use the gyroscope. However, it is more noisy and will work best outdoors.</p>
<h2>Noncompliant Code Example</h2>
<pre>
SensorManager sManager = (SensorManager) getSystemService(Context.SENSOR_SERVICE);
sManager.getDefaultSensor(Sensor.TYPE_ROTATION_VECTOR);
</pre>
<h2>Compliant Code Example</h2>
<pre>
SensorManager sManager = (SensorManager) getSystemService(Context.SENSOR_SERVICE);
sManager.getDefaultSensor(Sensor.TYPE_GEOMAGNETIC_ROTATION_VECTOR);
</pre>
```

## Implementation principle

- On the method `android.hardware.SensorManager#getDefaultSensor(int)`, checks that it is not called with parameter
  value `TYPE_ROTATION_VECTOR (11)`
