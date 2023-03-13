\newpage

# Leakage: Location Leak

## Platform

|   OS          |  OS version  |  Langage  |
|---------------|--------------|-----------|
|  Android      |       -      |  Java     |

## Main caracteristics

|   ID     | Title                | Category    | Sub-category   |
|----------|----------------------|-------------|----------------|
| ELEA003  | Location Leak        | Environment | Leakage        |

## Severity / Remediation Cost
  
|  Severity  | Remediation Cost    |
|------------|---------------------|
| Major      | Medium              |

## Rule short description

Failing to call android.location.LocationManager#removeUpdates() can drain the battery in just a few hours.

## Rule complete description

## Text

Most Android-powered devices have built-in sensors that measure motion, orientation, and various environmental conditions.
In addition to these are the image sensor (a.k.a Camera) and the geopositioning sensor (a.k.a GPS).
The common point of all these sensors is that they are expensive while in use. Their common bug is to let the sensor
unnecessarily process data when the app enters an idle state, typically when paused or stopped.
Consequently, calls must be carefully pairwised: `LocationManager.requestLocationUpdates()/removeUpdates()`.
Failing to do so can drain the battery in just a few hours.

## HTML

```html
<p>Most Android-powered devices have built-in sensors that measure motion, orientation, and various environmental conditions.
    In addition to these are the image sensor (a.k.a Camera) and the geopositioning sensor (a.k.a GPS).</p>
<br>The common point of all these sensors is that they are expensive while in use. Their common bug is to let the sensor
    unnecessarily process data when the app enters an idle state, typically when paused or stopped.</br>
    Consequently, calls must be carefully pairwised: <code>LocationManager.requestLocationUpdates()/removeUpdates()</code>.</br>
    Failing to do so can drain the battery in just a few hours.</p>
<h2>Noncompliant Code Example</h2>
<pre>
LocationManager locationManager = (LocationManager) getSystemService(LOCATION_SERVICE);
locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 1000L, 1.0f, this);
</pre>
<br>
<h2>Compliant Code Example</h2>
<pre>
LocationManager locationManager = (LocationManager) getSystemService(LOCATION_SERVICE);
locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 1000L, 1.0f, this);
locationManager.removeUpdates(this);
</pre>
```

## Implementation principle

- Look for `android.location.LocationManager.requestLocationUpdates()` and `android.location.LocationManager.removeUpdates()`.
  method invocations.
- In the compilation units where `requestLocationUpdates()` is called, be sure that at least one `removeUpdates()` is called
- If not, throw an issue on each `requestLocationUpdates()`.

> This implementation is quite simple and will give false positive in some cases. However it will quickly cover the
> majority of the cases.
