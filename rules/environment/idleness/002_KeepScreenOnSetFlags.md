\newpage

# Idleness: Keep Screen On (setFlags)

## Platform

|   OS     | OS version |  Langage  |
|----------|------------|-----------|
| Android  |     -      |  Java     |

## Main caracteristics

|   ID     | Title                      | Category    | Sub-category   |
|----------|----------------------------|-------------|----------------|
| EIDL002  | Keep Screen On (setFlags)  | Environment | Idleness       |

## Severity / Remediation Cost
 
| Severity | Remediation Cost |
|----------|------------------|
| Major    | Medium           |

## Rule short description

Keeping the screen on should be avoided to avoid draining the battery.

## Rule complete description

## Text

To avoid draining the battery, an Android device that is left idle quickly falls asleep.
Hence, keeping the screen on should be avoided, unless it is absolutely necessary. If so,
developers typically use the `FLAG_KEEP_SCREEN_ON` in their activity. Another way to implement
this is in their application's layout XML file, by using the `android:keepScreenOn attribute`.

## HTML

```html
<p>To avoid draining the battery, an Android device that is left idle quickly falls asleep.</br>
    Hence, keeping the screen on should be avoided, unless it is absolutely necessary. If so, developers typically
    use the <code>FLAG_KEEP_SCREEN_ON</code> in their activity. Another way to implement this is in their application's
    layout XML file, by using the <code>android:keepScreenOn</code> attribute.</p>
<h2>Noncompliant Code Example</h2>
<pre>
getWindow().setFlags(FLAG_KEEP_SCREEN_ON, FLAG_KEEP_SCREEN_ON);
</pre>
```

## Implementation principle

- On the method `android.view.Window#setFlags(int, int)`, checks that it is not called with parameter value `FLAG_KEEP_SCREEN_ON (0x00000080)`
- Check the flag value on both parameters
