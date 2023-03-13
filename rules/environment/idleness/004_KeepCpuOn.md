\newpage

# Idleness: Keep Cpu On

## Platform

|   OS     | OS version |  Langage  |
|----------|------------|-----------|
| Android  |     -      |  Java     |

## Main caracteristics

|   ID     | Title        | Category    | Sub-category   |
|----------|--------------|-------------|----------------|
| EIDL004  | Keep Cpu On  | Environment | Idleness       |

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
PowerManager pm = (PowerManager) getSystemService(Context.POWER_SERVICE);
WakeLock manager = pm.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, "TAG");
</pre>
```

## Implementation principle

- Checks that the method `android.os.PowerManager#newWakeLock(int levelAndFlags, String tag)` is not called.
