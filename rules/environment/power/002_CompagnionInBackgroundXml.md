\newpage

# Power: Compagnion In Background

## Platform

|   OS     | OS version |  Langage  |
|----------|------------|-----------|
| Android  |     -      |  XML      |

## Main caracteristics

|   ID     | Title                    | Category    | Sub-category   |
|----------|--------------------------|-------------|----------------|
| EPOW002  | Compagnion In Background | Environment | Power          |

## Severity / Remediation Cost
  
| Severity | Remediation Cost |
|----------|------------------|
| Major    | Medium           |

## Rule short description

Using the permission `REQUEST_COMPANION_RUN_IN_BACKGROUND` will have a negative effect on the device's battery life.

## Rule complete description

## Text

A negative effect on the device's battery is when an app is paired with a companion device (over Bluetooth, BLE, or Wi-Fi) and
that it has been excluded from battery optimizations (run in the background) using the declaration Manifest.permission.
REQUEST_COMPANION_RUN_IN_BACKGROUND.

## HTML

```html
<p>A negative effect on the device's battery is when an app is paired with a companion device (over Bluetooth, BLE, or Wi-Fi) 
and that it has been excluded from battery optimizations (run in the background) using the declaration
<code>Manifest.permission.REQUEST_COMPANION_RUN_IN_BACKGROUND</code>.</p>
<h2>Noncompliant Code Example</h2>
<pre>
&lt;manifest&gt;
   &lt;uses-permission android:name="android.permission.REQUEST_COMPANION_RUN_IN_BACKGROUND"&gt; 
&lt;/manifest&gt;
</pre>
```

## Implementation principle

- Add an Xml rule that check permission with xpath check: `//manifest/uses-permission/@name[. = \"android.permission.REQUEST_COMPANION_RUN_IN_BACKGROUND\"]`
