\newpage

# Sobriety: Thrifty Geolocation (minDistance)

## Platform

|   OS          |  OS version |  Langage  |
|---------------|-------------|-----------|
| Android       |      -      |  Java     |

## Main caracteristics

|   ID     | Title                             | Category    | Sub-category   |
|----------|-----------------------------------|-------------|----------------|
| ESOB010  | Thrifty Geolocation (minDistance) | Environment | Sobriety       |

## Severity / Remediation Cost

|  Severity  | Remediation Cost  |
|------------|-------------------|
| Minor      | Easy              |

## Rule short description

Location updates should be done with a distance interval greater than 0.

## Rule complete description

## Text

With a call to
`LocationManager#requestLocationUpdates(String provider, long minTime, float minDistance, LocationListener listener)`,
the provider will only send your application an update when the location has changed by at least minDistance meters
AND at least minTime milliseconds have passed. So minTime should be the primary tool to conserve battery life,
and, to a lesser extent, minDistance. These two must imperatively be greater than `0`.

## HTML

```html
<p>With a call to 
<code>LocationManager#requestLocationUpdates(String provider, long minTime, float minDistance, LocationListener listener)</code>, 
the location provider will only send your application an update when the location has
changed by at least minDistance meters AND at least minTime milliseconds have passed. 
So <code>minTime</code> should be the primary tool to conserve battery life, and, to 
a lesser extent, <code>minDistance</code>.
</br>These two must imperatively be greater than 0.</p>
<h2>Noncompliant Code Example</h2>
<pre>
    locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER,
                0,
                0,
                this);
</pre>
<h2>Compliant Code Example</h2>
<pre>
    locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER,
                60000L,  // refresh location at least each 60000ms
                10.0f,   // refresh location at least each 10 meters
                this);
</pre>
```

## Implementation principle

- Visit the method invocation nodes and check for method
  `android.location.LocationManager.requestLocationUpdates`
- If the first argument is a string check if the third argument equals `0` (it is always the minDistance).
- If the first argument is not a string check if the second argument equals `0` (it is always the minDistance).
