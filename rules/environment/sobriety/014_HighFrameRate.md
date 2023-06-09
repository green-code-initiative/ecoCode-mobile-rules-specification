\newpage

# Sobriety: High Frame Rate

## Platform

|   OS          |  OS version  |  Langage  |
|---------------|--------------|-----------|
| Android       |      -       |  Java     |

## Main caracteristics

|   ID     | Title                 | Category    | Sub-category   |
|----------|-----------------------|-------------|----------------|
| ESOB014  | High Frame Rate       | Environment | Sobriety       |

## Severity / Remediation Cost

|  Severity  | Remediation Cost |
|------------|------------------|
| Major      | Trivial          |

## Rule short description

To optimize content refresh and save energy, frame rate should be set at maximum 60Hz.

## Rule complete description

## Text

In Android 11 (API level 30) or higher, a call to `Surface#setFrameRate(float frameRate, int compatibility)` results
in a change to the display refresh rate. However, a regular app displays 60 frames per second (60Hz). In order to
optimize content refreshes and hence saving energy, this frequency should not be raised to 90Hz or 120Hz, despite this
is now supported by many devices.

## HTML

```html
<p>In Android 11 (API level 30) or higher, a call to
    <code>Surface#setFrameRate(float frameRate, int compatibility)</code> results in a change to the display refresh
    rate. However, a regular app displays 60 frames per second (60Hz). In order to optimize content refreshes and hence
    saving energy, this frequency should not be raised to 90Hz or 120Hz, despite this is now supported by many devices.
</p>
<h2>Noncompliant Code Example</h2>
<pre>
    surface.setFrameRate(120f, FRAME_RATE_COMPATIBILITY_DEFAULT);
</pre>
<h2>Compliant Code Example</h2>
<pre>
    surface.setFrameRate(60f, FRAME_RATE_COMPATIBILITY_DEFAULT);
</pre>
```

## Implementation principle

- On the method `Surface#setFrameRate(float frameRate,...)`, check that the first parameter value is more than `60.f`
  