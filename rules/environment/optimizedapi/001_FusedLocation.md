\newpage

# Optimized API: Fused Location

## Platform

|   OS     | OS version |  Langage  |
|----------|------------|-----------|
| Android  | -          |  Java     |

## Main caracteristics

|   ID    | Title          | Category    | Sub-category   |
|---------|----------------|-------------|----------------|
| EOPT001 | Fused Location | Environment | Optimized API  |

## Severity / Remediation Cost

| Severity | Remediation Cost |
|----------|------------------|
| Major    | Medium           |

## Rule short description

Use `com.google.android.gms.location` instead of `android.location` to maximize battery life.

## Rule complete description

### Text

The fused location provider is one of the location APIs in Google Play services which combines signals from GPS, Wi-Fi, and cell networks,
as well as accelerometer, gyroscope, magnetometer and other sensors. It is officially recommended to maximize battery life. Thus, developer
has to set up Google Play Service in her gradle file with a dependency to `com.google.android.gms:play-services-location:x.y.z`, and then to
import from `com.google.android.gms.location` instead of the `android.location package` of the SDK.

### HTML

```html
<p>The fused location provider is one of the location APIs in Google Play 
services which combines signals from GPS, Wi-Fi, and cell networks, as well 
as accelerometer, gyroscope, magnetometer and other sensors. It is officially
recommended to maximize battery life. </br>Thus, developer has to set up Google 
Play Service in her gradle file with a dependency to 
<code>com.google.android.gms:play-services-location:x.y.z</code>, and then to 
import from <code>com.google.android.gms.location</code> instead of the 
<code>android.location</code> package of the SDK.</p>
<h2>Noncompliant Code Example</h2>
<pre>
import android.location.*;
</pre>
<h2>Compliant Solution</h2>
<pre>
import com.google.android.gms.location.*;
</pre>
```

## Implementation principle

- Inspect the import node to find `android.location.*` import (or specific class import)
- Inspect the import node to find `com.google.android.gms.location.*` import (or specific class import)
- If the import is found and not the second then raise an issue
