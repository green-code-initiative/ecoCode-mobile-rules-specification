\newpage

# Leakage: Camera Leak

## Platform

|   OS          |  OS version  |  Langage  |
|---------------|--------------|-----------|
|  Android      |       -      |  Java     |

## Main caracteristics

|   ID     | Title                | Category    | Sub-category   |
|----------|----------------------|-------------|----------------|
| ELEA002  | Camera Leak          | Environment | Leakage        |

## Severity / Remediation Cost
  
|  Severity  | Remediation Cost    |
|------------|---------------------|
| Major      | Medium              |

## Rule short description

Failing to call android.hardware.Camera#release() can drain the battery in just a few hours.

## Rule complete description

## Text

Most Android-powered devices have built-in sensors that measure motion, orientation, and various environmental conditions.
In addition to these are the image sensor (a.k.a Camera) and the geopositioning sensor (a.k.a GPS).
The common point of all these sensors is that they are expensive while in use. Their common bug is to let the sensor
unnecessarily process data when the app enters an idle state, typically when paused or stopped.
Consequently, calls must be carefully pairwised: `Camera.open()/Camera.release()`.
Failing to do so can drain the battery in just a few hours.

## HTML

```html
<p>Most Android-powered devices have built-in sensors that measure motion, orientation, and various environmental conditions.
    In addition to these are the image sensor (a.k.a Camera) and the geopositioning sensor (a.k.a GPS).</p>
<p>The common point of all these sensors is that they are expensive while in use. Their common bug is to let the sensor
    unnecessarily process data when the app enters an idle state, typically when paused or stopped.</br>
    Consequently, calls must be carefully pairwised: <code>Camera.open()/Camera.release()</code>.</br>
    Failing to do so can drain the battery in just a few hours.</p>

<h2>Noncompliant Code Example</h2>
<pre>
Camera camera = Camera.open();
</pre>
<br>
<h2>Compliant Code Example</h2>
<pre>
Camera camera = Camera.open();
camera.release();
</pre>
```

## Implementation principle

- Look for `android.hardware.Camera.open()` and `android.hardware.Camera.release()`.
  method invocations.
- In the compilation units where `open()` is called, be sure that at least one `release()` is called
- If not, throw an issue on each `open()`.

> This implementation is quite simple and will give false positive in some cases. However it will quickly cover the
> majority of the cases.
