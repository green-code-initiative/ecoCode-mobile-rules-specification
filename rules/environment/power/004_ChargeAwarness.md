\newpage

# Power: Charge Awareness

## Platform

|   OS     | OS version |  Langage   |
|----------|------------|------------|
| Android  |     -      |  Java      |

## Main caracteristics

|   ID     | Title            | Category    | Sub-category   |
|----------|------------------|-------------|----------------|
| EPOW004  | Charge Awareness | Environment | Power          |

## Severity / Remediation Cost
  
| Severity  | Remediation Cost |
|-----------|------------------|
| Info      | None             |

## Rule short description

Monitoring power changes and customizing behavior depending on battery level is a good practice.

## Rule complete description

## Text

It's always good that an app has different behavior when device is connected/disconnected
to a power station, or has different battery levels. One can monitor the changes in charging
state with a broadcast receiver registered on the actions `ACTION_POWER_CONNECTED`
and `ACTION_POWER_DISCONNECTED`, or monitor significant changes in battery level with
a broadcast receiver registered on the actions `BATTERY_LOW` and `BATTERY_OKAY`.

## HTML

```html
<p>It's always good that an app has different behavior when device is 
  connected/disconnected to a power station, or has different battery levels. 
  One can monitor the changes in charging state with a broadcast receiver 
  registered on the actions <code>ACTION_POWER_CONNECTED</code> and 
  <code>ACTION_POWER_DISCONNECTED</code>, or monitor significant changes 
  in battery level with a broadcast receiver registered on the actions 
  <code>BATTERY_LOW</code> and <code>BATTERY_OKAY</code>.</p>

<h2>Compliant Code Example</h2>
<pre>
new IntentFilter(Intent.ACTION_POWER_CONNECTED)
</pre>
OR
<pre>
new IntentFilter(Intent.ACTION_POWER_DISCONNECTED)
</pre>
OR
<pre>
new IntentFilter(Intent.ACTION_POWER_BATTERY_OKAY)
</pre>
OR
<pre>
new IntentFilter(Intent.ACTION_POWER_BATTERY_LOW)
</pre>
```

## Implementation principle

- Look for `android.content.IntentFilter` constructor declaration or call to `IntentFilter.addAction()` or `IntentFilter.create()` methods
  - if the argument 0 is a `String`
    - if `String` value is `android.intent.action.ACTION_POWER_DISCONNECTED`
    OR
    - if `String` value is `android.intent.action.ACTION_POWER_CONNECTED`
    OR
    - if `String` value is `android.intent.action.BATTERY_LOW`
    OR
    - if `String` value is `android.intent.action.BATTERY_OKAY`
      - report issue on argument node
