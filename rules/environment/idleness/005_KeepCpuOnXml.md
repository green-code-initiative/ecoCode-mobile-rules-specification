\newpage

# Idleness: Keep Cpu On

## Platform

|   OS     | OS version |  Langage  |
|----------|------------|-----------|
| Android  |     -      |  XML      |

## Main caracteristics

|   ID     | Title         | Category    | Sub-category   |
|----------|---------------|-------------|----------------|
| EIDL005  | Keep Cpu On   | Environment | Idleness       |

## Severity / Remediation Cost

| Severity | Remediation Cost |
|----------|------------------|
| Major    | Major            |

## Rule short description

Keeping the screen on should be avoided to avoid draining battery.

## Rule complete description

## Text

To avoid draining the battery, an Android device that is left idle quickly falls asleep.
Hence, keeping the CPU on should be avoided, unless it is absolutely necessary. If so,
developers typically use a Power Manager system service feature called wake locks by invoking
PowerManager.WakeLock#newWakeLock(int levelAndFlags, String tag), along with the specific
permission WAKE_LOCK in their manifest.

## HTML

```html
<p>To avoid draining the battery, an Android device that is left idle quickly falls asleep.
    Hence, keeping the CPU on should be avoided, unless it is absolutely necessary.</br>
    If so, developers typically use a Power Manager system service feature called wake locks
    by invoking <code>PowerManager.WakeLock#newWakeLock(int levelAndFlags, String tag)</code>,
    along with the specific permission <code>WAKE_LOCK</code> in their manifest.</p>
<h2>Noncompliant Code Example</h2>
<pre>
&lt;manifest&gt;
    &lt;uses-permission android:name="android.permission.WAKE_LOCK" /&gt;
&lt;/manifest&gt;
</pre>
```

## Implementation principle

- Add an Xml rule that check permission with xpath check: `//manifest/uses-permission/@name[. = \"android.permission.WAKE_LOCK\"]`
