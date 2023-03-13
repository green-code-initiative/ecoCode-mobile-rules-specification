\newpage

# Sobriety: Thrifty Geolocation Criteria

## Platform

|   OS          |  OS version |  Langage  |
|---------------|-------------|-----------|
| Android       |      -      |  Java     |

## Main caracteristics

|   ID     | Title                         | Category    | Sub-category   |
|----------|-------------------------------|-------------|----------------|
| ESOB006  | Thrifty Geolocation Criteria  | Environment | Sobriety       |

## Severity / Remediation Cost

|  Severity  | Remediation Cost  |
|------------|-------------------|
| Major      | Easy              |

## Rule short description

**Case 1**:

You should configure a location provider (LocationManager.getBestProvider(...)) to optimize battery usage.

**Case 2**:

You should call Criteria.setPowerRequirement(POWER_LOW) to optimize battery usage.

**Case 3**:

You should set the power requirement to POWER_LOW to optimize battery usage.

## Rule complete description

## Text

Location awareness is one of the most popular features used by apps. An important point is to try to get
the best possible provider (`LocationManager#getBestProvider()`) based on an energy criteria thanks
to `Criteria#setPowerRequirement(int level)`, using constant `POWER_LOW` instead of `POWER_HIGH` or `POWER_MEDIUM`.

## HTML

```html
<p>Location awareness is one of the most popular features used by apps.  
An important point is to try to get the best possible provider 
(<code>LocationManager#getBestProvider()</code>) based on an energy criteria 
thanks to <code>Criteria#setPowerRequirement(int level)</code>, using constant
<code>POWER_LOW</code> instead of <code>POWER_HIGH</code> or 
<code>POWER_MEDIUM</code>.</p>
<h2>Noncompliant Code Example</h2>
<pre>
    locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER,
                1000L,
                1.0f,
                this);
</pre>
<h2>Compliant Code Example</h2>
<pre>
    Criteria criteria = new Criteria();
    criteria.setPowerRequirement(Criteria.POWER_LOW);
    locationManager.requestLocationUpdates(locationManager.getBestProvider(criteria,true),
                1000L,
                1.0f,
                this);
</pre>
```

## Implementation principle

**Case 1**:

- Visit the method invocation nodes and check for the method `android.location.LocationManager.requestLocationUpdates`.  
- If the method is called:
  - if the method `getBestProvider` of type `android.location.LocationManager` is not called report an issue
    on `requestLocationUpdates`.

**Case 2**:

- Visit the method invocation nodes and check for the method `android.location.LocationManager.requestLocationUpdates`.  
- If the method is called:
  - if the method `getBestProvider` of type `android.location.LocationManager` is called and the method
    `setPowerRequirement` of type `android.location.Criteria` is not called report an issue on  `getBestProvider`.

**Case 3**:

- Visit the method invocation nodes.
- If the method `setPowerRequirement` of type `android.location.Criteria` is called report an issue on its first
  argument if it's not `1`.
