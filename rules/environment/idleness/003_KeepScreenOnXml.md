\newpage

# Idleness : Keep Screen On (Layout XML)

## Platform

|   OS     | OS version |  Langage  |
|----------|------------|-----------|
| Android  |     -      |  XML      |

## Main caracteristics

|   ID     | Title                         | Category    | Sub-category   |
|----------|-------------------------------|-------------|----------------|
| EIDL003  | Keep Screen On (Layout XML)   | Environment | Idleness       |

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
&lt;RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:keepScreenOn="true"/&gt;
</pre>
<h2>Compliant Code Example</h2>
<pre>
&lt;RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:keepScreenOn="false"/&gt;
</pre>
```

## Implementation principle

- Add an xml Rule with the following xpath check: `//*[contains(@keepScreenOn, 'true')]/@keepScreenOn`
