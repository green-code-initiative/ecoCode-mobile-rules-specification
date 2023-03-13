\newpage

# Bottleneck: Internet In The Loop

## Platform

|   OS          |  OS version  |  Langage  |
|---------------|--------------|-----------|
|  Android      |      -       |  Java     |

## Main caracteristics

|   ID     | Title                | Category    | Sub-category   |
|----------|----------------------|-------------|----------------|
| EBOT001  | Internet In The Loop | Environment | Bottleneck     |

## Severity / Remediation Cost
  
|  Severity  | Remediation Cost    |
|------------|---------------------|
| Major      |        High         |

## Rule short description

Internet connection should not be opened in loops to preserve the battery.

## Rule complete description

## Text

Opening and closing internet connection continuously is extremely battery-inefficient since HTTP exchange
is the most consuming operation of the network. This bug typically occurs when one obtain a new `HttpURLConnection`
by calling `URL#openConnection()` within a loop control structure (while, for, do-while, for-each). Also, this
bad practice must be early prevented because it is the root of another evil that consists in polling data at
regular intervals, instead of using push notifications to save a lot of battery power.

## HTML

```html
<p>Opening and closing internet connection continuously is extremely battery-inefficient since HTTP exchange is the most
    consuming operation of the network. This bug typically occurs when one obtain a new <code>HttpURLConnection</code>
    by calling  <code>URL#openConnection()</code>  within a loop control structure (while, for, do-while, for-each).
    </br>Also, this bad practice must be early prevented because it is the root of another evil that consists in polling
    data at regular intervals, instead of using push notifications to save a lot of battery power.</p>
<h2>Noncompliant Code Example</h2>
<pre>
    for (int val : myArray) {
        URL.openConnection();
    }
</pre>
```

## Implementation principle

- Check for the method invocation `java.net.URL#openConnection()`.
- Go recursively through each parent node and check if it is a loop or not. If it is, throw an issue.
- Stop the check when the node is the compilation unit tree.
