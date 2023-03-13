\newpage

# Idleness: Rigid Alarm (setRepeating)

## Platform

|   OS     | OS version |  Langage  |
|----------|------------|-----------|
| Android  |      -     |  Java     |

## Main caracteristics

|   ID     | Title       | Category    | Sub-category   |
|----------|-------------|-------------|----------------|
| EIDL007  | Rigid Alarm | Environment | Idleness       |

## Severity / Remediation Cost

| Severity | Remediation Cost |
|----------|------------------|
| Major    | Complex          |

## Rule short description

Using exact alarms unnecessarily reduces the OS's ability to minimize battery use (i.e. Doze Mode).

## Rule complete description

## Text

Applications are strongly discouraged from using exact alarms unnecessarily as they reduce the OS's ability to minimize battery
use (i.e. Doze Mode).

For most apps prior to API 19, `setInexactRepeating()` is preferable over `setRepeating()`.
When you use this method, Android synchronizes multiple inexact repeating alarms and fires them at the same time, thus reducing
the battery drain.

Similarly after API 19, `setExact()` and `setExactAndAllowWhileIdle()` can significantly impact the power use of
the device when idle, so they should be used with care. High-frequency alarms are also bad for battery life but this is already
checked by Android lint (ShortAlarm built-in check).

## HTML

```html
<p>Applications are strongly discouraged from using exact alarms unnecessarily as they reduce the OS's 
ability to minimize battery use (i.e. Doze Mode).</p>
<p>For most apps prior to API 19, <code>setInexactRepeating()</code> is preferable over 
<code>setRepeating()</code>. When you use this method, Android synchronizes multiple inexact 
repeating alarms and fires them at the same time, thus reducing the battery drain.</p>
<p>Similarly after API 19, <code>setExact()</code> and <code>setExactAndAllowWhileIdle()</code> 
can significantly impact the power use of the device when idle, so they should be used with 
care. High-frequency alarms are also bad for battery life but this is already checked by Android 
lint (ShortAlarm built-in check).</p>
<h2>Noncompliant Code Example</h2>
<pre>
AlarmManager alarmManager = (AlarmManager) this.getSystemService(Context.ALARM_SERVICE);
alarmManager.setRepeating(alarmType, triggerAtMillis, intervalMillis, operation);
</pre>
or
<pre>
AlarmManager alarmManager = (AlarmManager) this.getSystemService(Context.ALARM_SERVICE);
alarmManager.setExact(type,triggerAtMillis,operation);
</pre>
or
<pre>
AlarmManager alarmManager = (AlarmManager) this.getSystemService(Context.ALARM_SERVICE);
alarmManager.setExact(type,triggerAtMillis,tag,listener,targetHandler);
</pre>
or
<pre>
AlarmManager alarmManager = (AlarmManager) this.getSystemService(Context.ALARM_SERVICE);
alarmManager.setExactAndAllowWhileIdle(type,triggerAtMilllis,operation);
</pre>
<h2>Compliant Code Example</h2>
<pre>
AlarmManager alarmManager = (AlarmManager) this.getSystemService(Context.ALARM_SERVICE);
alarmManager.setInexactRepeating(alarmType, triggerAtMillis, intervalMillis, operation);
</pre>
```

## Implementation principle

- Search for `android.app.AlarmManager#setRepeating()` method invocation.
or
- Search for `android.app.AlarmManager#setExact()` method invocation.
or
- Search for `android.app.AlarmManager#setExactAndAllowWhileIdle()` method invocation.
