\newpage

# Optimized API: Bluetooth Low-Energy

## Platform

|   OS     | OS version |  Langage  |
|----------|------------|-----------|
| Android  | -          |  Java     |

## Main caracteristics

|   ID    | Title                | Category    | Sub-category   |
|---------|----------------------|-------------|----------------|
| EOPT002 | Bluetooth Low-Energy | Environment | Optimized API  |

## Severity / Remediation Cost

- **Case 1**:
  
| Severity | Remediation Cost |
|----------|------------------|
| Info     | Medium           |

- **Case 2**:

| Severity | Remediation Cost |
|----------|------------------|
| Helpful  | None             |

## Rule short description

- **Case 1**: You are using Bluetooth. Did you take a look at the Bluetooth Low Energy API?
- **Case 2**: Using `android.bluetooth.le.*` is a good practice.

## Rule complete description

## Text

In contrast to classic Bluetooth, Bluetooth Low Energy (BLE) is designed to provide significantly
lower power consumption. Its purpose is to save energy on both paired devices but very few developers
are aware of this alternative API. From the Android client side, it means append
`android.bluetooth.le.*` imports to `android.bluetooth.*` imports in order to benefits from low-energy features.

## HTML

```html
<p>In contrast to classic Bluetooth, Bluetooth Low Energy (BLE) 
is designed to provide significantly lower power consumption.
Its purpose is to save energy on both paired devices but very few 
developers are aware of this alternative API.
From the Android client side, it means append <code>android.bluetooth.le.*</code> 
imports to <code>android.bluetooth.*</code> imports in order to benefits from 
low-energy features.</p>
<h2>Noncompliant Code Example</h2>
<pre>
import android.bluetooth.*
</pre>
<h2>Compliant Solution</h2>
<pre>
import android.bluetooth.le.*
</pre>
```

## Implementation principle

- Inspect the import nodes and look for `android.bluetooth.*` imports (or class imports)
- Inspect the import nodes and look for `android.bluetooth.le.*` imports (or class imports)
- If you find only `android.bluetooth.*` imports, raise the **case 1** issue
- If you find only `android.bluetooth.le.*` imports or both `android.bluetooth.*`
  and `android.bluetooth.le.*`, raise the **case 2** issue
