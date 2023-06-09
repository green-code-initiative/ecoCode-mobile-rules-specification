\newpage

# Sobriety: Thrifty Bluetooth Low Energy (requestConnectionPriority)

## Platform

|   OS          |  OS version  |  Langage  |
|---------------|--------------|-----------|
| Android       |      -       |  Java     |

## Main caracteristics

|   ID     | Title                                                    | Category    | Sub-category   |
|----------|----------------------------------------------------------|-------------|----------------|
| ESOB008  | Thrifty Bluetooth Low Energy (requestConnectionPriority) | Environment | Sobriety       |

## Severity / Remediation Cost
  
|  Severity  | Remediation Cost  |
|------------|-------------------|
| Major      | Minor             |

## Rule short description

Invoking BluetoothGatt.requestConnectionPriority(CONNECTION_PRIORITY_LOW_POWER) is recommend to reduce power consumption.

## Rule complete description

## Text

With Bluetooth Low Energy technology (see BLE API smell), a Bluetooth Smart Ready device (the master)
will establish a link with a Bluetooth Smart device (the slave). Most often, the slave is a GATT
server and the master is a GATT client. GATT capable devices can be discovered using BLE scan process.

Invoking `BluetoothGatt#requestConnectionPriority(int connectionPriority)` with the value `CONNECTION_PRIORITY_LOW_POWER`,
is recommend to reduce power consumption.

## HTML

```html
<p>With Bluetooth Low Energy technology (see BLE API smell), a Bluetooth Smart Ready 
device (the master) will establish a link with a Bluetooth Smart device (the slave). 
Most often, the slave is a GATT server and the master is a GATT client. GATT capable 
devices can be discovered using BLE scan process.</p>
<p>Invoking <code>BluetoothGatt#requestConnectionPriority(int connectionPriority)</code> 
with the value <code>CONNECTION_PRIORITY_LOW_POWER</code>, is recommend to reduce
power consumption.
</p>
<h2>Noncompliant Code Example</h2>
<pre>
BluetoothGatt gatt = new BluetoothGatt();
gatt.requestConnectionPriority(CONNECTION_PRIORITY_HIGH);
</pre>
<h2>Compliant Code Example</h2>
<pre>
BluetoothGatt gatt = new BluetoothGatt();
gatt.requestConnectionPriority(CONNECTION_PRIORITY_LOW_POWER);
</pre>
```

## Implementation principle

- On the method `android.bluetooth.BluetoothGatt#requestConnectionPriority(int)`, reports an issue if
  it is called with a parameter value different from `CONNECTION_PRIORITY_LOW_POWER (2)`.
