\newpage

# Leakage: SensorManager Leak

## Platform

|   OS          |  OS version  |  Langage  |
|---------------|--------------|-----------|
|  Android      |       -      |  Java     |

## Main caracteristics

|   ID     | Title                | Category    | Sub-category   |
|----------|----------------------|-------------|----------------|
| ELEA004  | SensorManager Leak   | Environment | Leakage        |

## Severity / Remediation Cost
  
|  Severity  | Remediation Cost    |
|------------|---------------------|
| Major      | Medium              |

## Rule short description

Failing to call android.hardware.SensorManager#unregisterListener() can drain the battery in just a few hours.

## Rule complete description

## Text

Most Android-powered devices have built-in sensors that measure motion, orientation, and various environmental conditions.
In addition to these are the image sensor (a.k.a Camera) and the geopositioning sensor (a.k.a GPS).
The common point of all these sensors is that they are expensive while in use. Their common bug is to let the sensor
unnecessarily process data when the app enters an idle state, typically when paused or stopped.
Consequently, calls must be carefully pairwised: `SensorManager#registerListener()/unregisterListener()`.
Failing to do so can drain the battery in just a few hours.

## HTML

```html
<p>Most Android-powered devices have built-in sensors that measure motion, orientation, and various environmental conditions.
    In addition to these are the image sensor (a.k.a Camera) and the geopositioning sensor (a.k.a GPS).</p>
<p>The common point of all these sensors is that they are expensive while in use. Their common bug is to let the sensor
    unnecessarily process data when the app enters an idle state, typically when paused or stopped.</br>
    Consequently, calls must be carefully pairwised: <code>SensorManager#registerListener()/unregisterListener()</code>.</br>
    Failing to do so can drain the battery in just a few hours.</p>

<h2>Noncompliant Code Example</h2>
<pre>
SensorManager sManager = (SensorManager) getSystemService(Context.SENSOR_SERVICE);
Sensor accelerometer = sManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
sManager.registerListener(this,accelerometer,SensorManager.SENSOR_DELAY_NORMAL);
</pre>
<br>
<h2>Compliant Code Example</h2>
<pre>
SensorManager sManager = (SensorManager) getSystemService(Context.SENSOR_SERVICE);
Sensor accelerometer = sManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
sManager.registerListener(this,accelerometer,SensorManager.SENSOR_DELAY_NORMAL);
sManager.unregisterListener(this);
</pre>
```

## Implementation principle

- Look for `android.hardware.SensorManager.registerListener()` and `android.hardware.SensorManager.unregisterListener()`.
  method invocations.
- In the compilation units where `registerListener()` is called, be sure that at least one `unregisterListener()` is called
- If not, throw an issue on each `registerListener()`.

> This implementation is quite simple and will give false positive in some cases. However it will quickly cover the
> majority of the cases.
