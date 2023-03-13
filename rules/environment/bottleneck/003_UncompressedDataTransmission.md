\newpage

# Bottleneck: Uncompressed Data Transmission

## Platform

|   OS          |  OS version  |  Langage  |
|---------------|--------------|-----------|
|  Android      |      -       |  Java     |

## Main caracteristics

|   ID     | Title                          | Category    | Sub-category   |
|----------|--------------------------------|-------------|----------------|
| EBOT003  | Uncompressed Data Transmission | Environment | Bottleneck     |

## Severity / Remediation Cost
  
|  Severity  | Remediation Cost |
|------------|------------------|
| Minor      |      Easy        |

## Rule short description

Prefer using GzipOutputStream instead of OutputStream to improve energy efficiency.

## Rule complete description

## Text

Transmitting a file over a network infrastructure without compressing it consumes more
energy than with compression. More precisely, energy efficiency is improved in case the
data is compressed at least by 10%, transmitted and decompressed at the other network node.
From the Android client side, it means making a post HTTP request using a `GZIPOutputStream`
instead of the classical `OutputStream`, along with the `HttpURLConnection` object.

## HTML

```html
<p>Transmitting a file over a network infrastructure without compressing it consumes more energy than with compression. More precisely, energy efficiency is improved in case the data is compressed at least by 10%, transmitted and decompressed at the other network node. From the Android client side, it means making a post HTTP request using a <code>GZIPOutputStream</code> instead of the classical OutputStream, along with the <code>HttpURLConnection</code> object.</p>
<h2>Noncompliant Code Example</h2>
<pre>
Url url = new Url("https://www.ecocode.io/");
HttpsUrlConnection con = (HttpsURLConnection) url.openConnection();
OutputStream stream = con.getOutputStream();
</pre>
<h2>Compliant Code Example</h2>
<pre>
Url url = new Url("https://www.ecocode.io/");
HttpsUrlConnection con = (HttpsURLConnection) url.openConnection();
OutputStream stream = new GZIPOutputStream(con.getOutputStream());
</pre>
```

## Implementation principle

If an OutputStream class is created:

- if the method `getOutputStream` from the `URLConnection` class is called, reports the issue.
- if a constructor is called with parameter `getOutputStream` of `URLConnection`, reports the issue if the constructor isn't a `GZIPOutputStream`.
