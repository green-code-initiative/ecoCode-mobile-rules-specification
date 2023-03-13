\newpage

# Bottleneck: Wifi Multicast Lock

## Platform

|   OS          |  OS version  |  Langage  |
|---------------|--------------|-----------|
|  Android      |      -       |  Java     |

## Main caracteristics

|   ID     | Title                | Category    | Sub-category   |
|----------|----------------------|-------------|----------------|
| EBOT002  | Wifi Multicast Lock  | Environment | Bottleneck     |

## Severity / Remediation Cost
  
|  Severity  | Remediation Cost    |
|------------|---------------------|
| Minor      |      Medium         |

## Rule short description

Failing to call WifiManager.MulticastLock#release() can cause a noticeable battery drain.

## Rule complete description

## Text

Normally the Wifi stack filters out packets not explicitly addressed to the device. Acquiring a Multicast Lock with
`WifiManager.MulticastLock#acquire()` will cause the stack to receive packets addressed to multicast addresses.
Processing these extra packets can cause a noticeable battery drain and must be disabled when not needed with to
a call to `WifiManager.MulticastLock#release().`

## HTML

```html
<p>Normally the Wifi stack filters out packets not explicitly addressed to the device. Acquiring a Multicast Lock with
    <code>WifiManager.MulticastLock.acquire()</code> will cause the stack to receive packets addressed to multicast
    addresses.</p>
<p>Processing these extra packets can cause a noticeable battery drain and must be disabled when not needed
    with to a call to <code>WifiManager.MulticastLock.release()</code>.</p>
<h2>Noncompliant Code Example</h2>
<pre>
WifiManager wifiManager = (WifiManager) getApplicationContext().getSystemService(Context.WIFI_SERVICE);
WifiManager.MulticastLock lock = wifiManager.createMulticastLock("tag");
lock.acquire();
</pre>
<h2>Compliant Code Example</h2>
<pre>
WifiManager wifiManager = (WifiManager) getApplicationContext().getSystemService(Context.WIFI_SERVICE);
WifiManager.MulticastLock lock = wifiManager.createMulticastLock("tag");
lock.acquire();
lock.release()
</pre>
```

## Implementation principle

- Look for `android.net.wifi.WifiManager$MulticastLock.acquire()` and `android.net.wifi.WifiManager$MulticastLock.release()`.
  method invocations.
- In the compilation units where `acquire()` is called, be sure that at least one `release()` is called
- If not, throw an issue on each `acquire()`.

> This implementation is quite simple and will give false positive in some cases. However it will quickly cover the
> majority of the cases.
