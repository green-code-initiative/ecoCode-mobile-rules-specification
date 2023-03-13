\newpage

# Power: Charge Awareness

## Platform

|   OS     | OS version |  Langage  |
|----------|------------|-----------|
| Android  |     -      |  XML      |

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
to a power station, or has different battery levels. One can monitor the changes in
charging state with a broadcast receiver registered on the actions `ACTION_POWER_CONNECTED`
and `ACTION_POWER_DISCONNECTED`, or monitor significant changes in battery level with a
broadcast receiver registered on the actions `BATTERY_LOW` and `BATTERY_OKAY`.

## HTML

```html
<p>It's always good that an app has different behavior when device is 
    connected/disconnected to a power station, or has different battery 
    levels. One can monitor the changes in charging state with a broadcast 
    receiver registered on the actions <code>ACTION_POWER_CONNECTED</code> 
    and <code>ACTION_POWER_DISCONNECTED</code>, or monitor significant 
    changes in battery level with a broadcast receiver registered on the 
    actions <code>BATTERY_LOW</code> and <code>BATTERY_OKAY</code>.</p>

<h2>Compliant Code Example</h2>
<pre>
&lt;receiver android:name="io.ecocode.testapp.core.service.MyReceiver"&gt;
    &lt;intent-filter&gt;
        &lt;action android:name="android.intent.action.ACTION_POWER_CONNECTED"/&gt;
    &lt;/intent-filter&gt;
&lt;/receiver&gt;
</pre>
OR
<pre>
&lt;receiver android:name="io.ecocode.testapp.core.service.MyReceiver"&gt;
    &lt;intent-filter&gt;
        &lt;action android:name="android.intent.action.ACTION_POWER_DISCONNECTED"/&gt;
    &lt;/intent-filter&gt;
&lt;/receiver&gt;
</pre>
OR
<pre>
&lt;receiver android:name="io.ecocode.testapp.core.service.MyReceiver"&gt;
    &lt;intent-filter&gt;
        &lt;action android:name="android.intent.action.ACTION_POWER_BATTERY_OKAY"/&gt;
    &lt;/intent-filter&gt;
&lt;/receiver&gt;
</pre>
OR
<pre>
&lt;receiver android:name="io.ecocode.testapp.core.service.MyReceiver"&gt;
    &lt;intent-filter&gt;
        &lt;action android:name="android.intent.action.ACTION_POWER_BATTERY_LOW"/&gt;
    &lt;/intent-filter&gt;
&lt;/receiver&gt;
</pre>
```

## Implementation principle

- Add an Xml rule that check actions from receivers with xpath check:
`//manifest/application/receiver/intent-filter/action/@name[.=\"android.intent.action.BATTERY_LOW\"]`
||
`//manifest/application/receiver/intent-filter/action/@name[.=\"android.intent.action.BATTERY_OKAY\"]`
||
`//manifest/application/receiver/intent-filter/action/@name[.=\"android.intent.action.ACTION_POWER_CONNECTED\"]`
||
`//manifest/application/receiver/intent-filter/action/@name[.=\"android.intent.action.ACTION_POWER_DISCONNECTED\"]`
