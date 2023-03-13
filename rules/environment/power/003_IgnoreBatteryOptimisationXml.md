\newpage

# Power: Ignore Battery Optimizations

## Platform

|   OS     | OS version |  Langage  |
|----------|------------|-----------|
| Android  |     -      |  XML      |

## Main caracteristics

|   ID     | Title                        | Category    | Sub-category   |
|----------|------------------------------|-------------|----------------|
| EPOW003  | Ignore Battery Optimizations | Environment | Power          |

## Severity / Remediation Cost
  
| Severity  | Remediation Cost |
|-----------|------------------|
| Major     | Major            |

## Rule short description

Battery optimization should not be ignored.

## Rule complete description

## Text

An app holding the REQUEST_IGNORE_BATTERY_OPTIMIZATIONS ask the user to allow it to ignore battery optimizations (that is, put them on the whitelist of apps). Most applications should not use this; there are many facilities provided by the platform for applications to operate correctly in the various power saving modes.

## HTML

```html
<p>An app holding the permission <code>REQUEST_IGNORE_BATTERY_OPTIMIZATIONS</code> asks the user to allow it to ignore
battery optimizations (that is, put them on the whitelist of apps).</p>
<p>Most applications should not use this; there are many facilities provided by the platform for applications to
operate correctly in the various power saving modes.<p/>

<h2>Noncompliant Code Example</h2>
<pre>
&lt;manifest&gt;
    &lt;uses-permission android:name="android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS" /&gt;
&lt;/manifest&gt;
</pre>
```

## Implementation principle

- Add an Xml rule that check permission with xpath check: `//manifest/uses-permission/@name[. = \"android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS\"]`
