\newpage

# Sobriety: Thrifty Bluetooth Low Energy (setAdvertiseMode)

## Platform

|   OS          |  OS version  |  Langage  |
|---------------|--------------|-----------|
| Android       |      -       |  Java     |

## Main caracteristics

|   ID     | Title                                           | Category    | Sub-category   |
|----------|-------------------------------------------------|-------------|----------------|
| ESOB007  | Thrifty Bluetooth Low Energy (setAdvertiseMode) | Environment | Sobriety       |

## Severity / Remediation Cost
  
|  Severity  | Remediation Cost  |
|------------|-------------------|
| Major      | Minor             |

## Rule short description

You should call `AdvertiseSettings.Builder.setAdvertiseMode(ADVERTISE_MODE_LOW_POWER)` to optimize battery usage.

## Rule complete description

## Text

With Bluetooth Low Energy technology (see BLE API smell), a Bluetooth Smart Ready device (the master) will establish a link
with a Bluetooth Smart device (the slave). Most often, the slave is a GATT server and the master is a GATT client.
GATT capable devices can be discovered using BLE scan process.

The default and preferred advertising mode is `ADVERTISE_MODE_LOW_POWER` when calling
`AdvertiseSettings.Builder#setAdvertiseMode(int advertiseMode)`.

## HTML

```html
<p>With Bluetooth Low Energy technology, a Bluetooth Smart Ready device (the master) 
will establish a link with a Bluetooth Smart device (the slave). Most often, 
the slave is a GATT server and the master is a GATT client. GATT capable 
devices can be discovered using BLE scan process.</p>
<p>The default and preferred advertising mode is <code>ADVERTISE_MODE_LOW_POWER</code> 
when calling <code>AdvertiseSettings.Builder#setAdvertiseMode(int advertiseMode).</code>
</p>
<h2>Noncompliant Code Example</h2>
<pre>
AdvertiseSettings.Builder builder = new AdvertiseSettings.Builder();
builder.setAdvertiseMode(AdvertiseSettings.ADVERTISE_MODE_LOW_LATENCY);
</pre>
<h2>Compliant Code Example</h2>
<pre>
AdvertiseSettings.Builder builder = new AdvertiseSettings.Builder();
builder.setAdvertiseMode(AdvertiseSettings.ADVERTISE_MODE_LOW_POWER);
</pre>
```

## Implementation principle

- On the method `android.bluetooth.le.AdvertiseSettings$Builder#setAdvertiseMode(int)`, report an issue if
  it is called with parameter value different from `ADVERTISE_MODE_LOW_POWER (0)`.
