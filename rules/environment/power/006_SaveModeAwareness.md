\newpage

# Power: Save Mode Awareness

## Platform

|   OS     | OS version |  Langage   |
|----------|------------|------------|
| Android  |     -      |  Java      |

## Main caracteristics

|   ID     | Title               | Category    | Sub-category   |
|----------|---------------------|-------------|----------------|
| EPOW006  | Save Mode Awareness | Environment | Power          |

## Severity / Remediation Cost
  
| Severity  | Remediation Cost |
|-----------|------------------|
| Info      | None             |

## Rule short description

Taking into account when the device is entering or exiting the power save mode is a good practice.

## Rule complete description

## Text

Taking into account when the device is entering or exiting the power save mode is higly desirable for the battery life.\
It implies the existence of a broadcast receiver registered on the action `ACTION_POWER_SAVE_MODE_CHANGED`,\
or programmaticaly with a call to `PowerManager#isPowerSaveMode()`.

## HTML

```html
<p>Taking into account when the device is entering or exiting the power save mode is higly desirable for the battery life.<br>
  It implies the existence of a broadcast receiver registered on the action <code>ACTION_POWER_SAVE_MODE_CHANGED</code>,<br>
  or programmaticaly with a call to <code>PowerManager#isPowerSaveMode()</code>.</p>

<h2>Compliant Code Example</h2>
<pre>
new IntentFilter(Intent.ACTION_BATTERY_CHANGED);
</pre>
OR
<pre>
filter.addAction(Intent.ACTION_BATTERY_CHANGED);
</pre>
OR
<pre>
IntentFilter.create(Intent.ACTION_BATTERY_CHANGED,"");
</pre>
OR
<pre>
powerManager.isPowerSaveMode();
</pre>
```

## Implementation principle

- Parse the new_class node
- if ownerType is : `android.content.IntentFilter`
  - if argument 0 is `String`
    - if `String` value is `android.intent.action.BATTERY_CHANGED`
      - report issue on argument node
- Parse the method invocation node
 - if ownerType is : `android.content.IntentFilter`
   - if methodName is : `addAction`
     - if first argument is `String`
       - if `String` value is `android.intent.action.BATTERY_CHANGED`
       - report issue on argument node
   - if methodName is : `create`
     - if first argument is `String`
       - if `String` value is `android.intent.action.BATTERY_CHANGED`
       - report issue on argument node
 - if ownerType is : `android.os.PowerManager`
   - if methodName is : `isPowerSaveMode`
     - report issue on method node