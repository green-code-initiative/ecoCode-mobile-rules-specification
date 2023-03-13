\newpage

# Batch: Service Boot Time

## Platform

|   OS     | OS version |  Langage  |
|----------|------------|-----------|
| Android  |     -      |  XML      |

## Main caracteristics

|   ID     | Title                    | Category    | Sub-category   |
|----------|--------------------------|-------------|----------------|
| EBAT001  | Service Boot Time        | Environment | Batch          |

## Severity / Remediation Cost
  
| Severity | Remediation Cost |
|----------|------------------|
| Major    | Easy             |

## Rule short description

Avoid using a receiver to launch a service with `BOOT_COMPLETED` to drain less battery

## Rule complete description

## Text

Services are long-living operations, as components of the apps. However, they can be started in isolation each time the device is next started, without the user's acknowledgement.\
This technique should be discouraged because the accumulation of these silent services results in excessive battery depletion that remains unexplained from the end-user's point of view.\
In addition, end-users know how to kill applications, but more rarely how to kill services.\
Thus, any developer should avoid having a call to `Context#startService()` from a Broadcast Receiver component that has specified an intent-filter for the `BOOT_COMPLETED` action in the manifest.

## HTML

```html
<p>Services are long-living operations, as components of the apps. However, they can be started in isolation each time the device is next started, without the user's acknowledgement.<br>
    This technique should be discouraged because the accumulation of these silent services results in excessive battery depletion that remains unexplained from the end-user's point of view.<br>
    In addition, end-users know how to kill applications, but more rarely how to kill services.<br>
    Thus, any developer should avoid having a call to <code>Context#startService()</code> from a Broadcast Receiver component that has specified an intent-filter for the <code>BOOT_COMPLETED</code> action in the manifest.</p>
<h2>Noncompliant Code Example</h2>
<pre>
&lt;receiver&gt;
    &lt;intent-filter&gt;
        &lt;action android:name= "android.intent.action.BOOT_COMPLETED"/&gt;
    &lt;/intent-filter&gt;
&lt;/receiver&gt;
</pre>
```

## Implementation principle

- Add an Xml rule that check the usage of `BOOT_COMPLETED` with xpath check: `//manifest/application/receiver/intent-filter/action/@name[. = "android.intent.action.BOOT_COMPLETED"]`
