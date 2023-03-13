\newpage

# Batch: Service Boot Time

## Platform

|   OS     | OS version |  Langage  |
|----------|------------|-----------|
| Android  |     -      |  Java     |

## Main caracteristics

|   ID     | Title                    | Category    | Sub-category   |
|----------|--------------------------|-------------|----------------|
| EBAT002  | Sensor Coalesce          | Environment | Batch          |

## Severity / Remediation Cost
  
| Severity | Remediation Cost |
|----------|------------------|
| Minor    | Medium           |

## Rule short description

Prefer using a reported latency on your `SensorManager` to reduce the power consumption of the app

## Rule complete description

## Text

With `SensorManager#registerListener(SensorEventListener, Sensor, int)` the events are delivered as soon as possible.\
Instead, `SensorManager#registerListener(SensorEventListener, Sensor, int, int maxReportLatencyUs)`\
allows events to stay temporarily in the hardware FIFO (queue) before being delivered.\
The events can be stored in the hardware FIFO up to `maxReportLatencyUs` microseconds.\
Once one of the events in the FIFO needs to be reported, all of the events in the FIFO are reported sequentially.\
Setting `maxReportLatencyUs` to a positive value allows to reduce the number of interrupts the AP (Application Processor) receives,\
hence reducing power consumption, as the AP can switch to a lower power state while the sensor is capturing the data.

## HTML

```html
<p>With <code>SensorManager#registerListener(SensorEventListener, Sensor, int)</code> the events are delivered as soon as possible.<br>
    Instead, <code>SensorManager#registerListener(SensorEventListener, Sensor, int, int maxReportLatencyUs)</code><br>
    allows events to stay temporarily in the hardware FIFO (queue) before being delivered.<br>
    The events can be stored in the hardware FIFO up to <code>maxReportLatencyUs</code> microseconds.<br>
    Once one of the events in the FIFO needs to be reported, all of the events in the FIFO are reported sequentially.<br>
    Setting <code>maxReportLatencyUs</code> to a positive value allows to reduce the number of interrupts the AP (Application Processor) receives,<br>
    hence reducing power consumption, as the AP can switch to a lower power state while the sensor is capturing the data.</p>
<h2>Noncompliant Code Example</h2>
<pre>
    SensorEventListener sensorEventListener;
    SensorManager sensorManager;
    Sensor sensor;

    sensorManager.registerListener(sensorEventListener, sensor, SensorManager.SENSOR_DELAY_NORMAL);
</pre>
<h2>Compliant Code Example</h2>
<pre>
    SensorEventListener sensorEventListener;
    SensorManager sensorManager;
    Sensor sensor;

    sensorManager.registerListener(sensorEventListener, sensor, SensorManager.SENSOR_DELAY_NORMAL, 200000);
</pre>
```

## Implementation principle

- On the method `android.hardware.SensorManager#registerListener`, checks that it's being called with a positive number as 4th parameter
