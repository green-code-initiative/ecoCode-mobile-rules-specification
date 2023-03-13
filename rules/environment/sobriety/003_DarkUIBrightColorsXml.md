\newpage

# Sobriety: Dark UI (Bright Colors)

## Platform

|   OS          |  OS version  |  Langage  |
|---------------|--------------|-----------|
| Android       |      -       |  XML      |

## Main caracteristics

|   ID     | Title                   | Category    | Sub-category   |
|----------|-------------------------|-------------|----------------|
| ESOB003  | Dark UI (Bright Colors) | Environment | Sobriety       |

## Severity / Remediation Cost

|  Severity  | Remediation Cost    |
|------------|---------------------|
| Minor      | High                |

## Rule short description

Avoid using too bright colors for (AM)OLED screens.

## Rule complete description

## Text

Displaying dark colors is particularly beneficial for mobile devices with (AM)OLED screens.
Consequently, custom resources like bright colors values and bitmap images with too high luminance should be avoided.

## HTML

```html
<p>Displaying dark colors is particularly beneficial for mobile devices with (AM)OLED screens.</br>
Consequently, custom resources like bright colors values and bitmap images with too high luminance should be avoided.</p>
<h2>Noncompliant Code Example</h2>
<pre>
&lt;TextView
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:foreground="#FFFFFF"
    android:foregroundTint="#FFFFFF"&gt;
&lt;/TextView&gt;
</pre>
```

## Implementation principle

- Checks color declarations in resources xml. Two cases:
  
  - Case 1:

    - Checks for a list of given attribute that may contain a color in all xml nodes (`background`, `foreground`,
      `foregroundTint`, `tint`, `src`, `textColor`, `color`, `textColorHighlight`, `textColorHint`, `textColorLink`,
      `shadowColor`, `srcCompat`)
    - If the value is an hexa value >= to a given brightness threshold throw an issue
  
  - Case 2:
  
    - Checks the `<resources><color>` tag
    - If the value is an hexa value >= to a given brightness threshold throw an issue

We will use this method to calculate the image brightness with `DARKNESS_CAP_VALUE=0.6`:

```java
private void checkDarkColor(String hexValue, Node nodeToReport, String message) {
    hexValue = hexValue.substring(1);
    int colorHex = (int) Long.parseLong(hexValue, 16);
    int r = (colorHex >> 16) & 0xFF;
    int g = (colorHex >> 8) & 0xFF;
    int b = (colorHex >> 0) & 0xFF;
    double darkness = 1 - (0.299 * r + 0.587 * g + 0.114 * b) / 255;
    if (darkness < DARKNESS_CAP_VALUE) {
        // report issue
    }
}
```
