\newpage

# Sobriety: Brightness Override

## Platform

|   OS          |  OS version  |  Langage  |
|---------------|--------------|-----------|
| Android       |      9+      |  Java     |

## Main caracteristics

|   ID     | Title                | Category    | Sub-category   |
|----------|----------------------|-------------|----------------|
| ESOB002  | Brightness Override  | Environment | Sobriety       |

## Severity / Remediation Cost

|  Severity  | Remediation Cost    |
|------------|---------------------|
| Minor      | Medium              |

## Rule short description

Forcing brightness to max value may cause useless energy consumption.

## Rule complete description

## Text

Introduced in Android 9, the adaptive brightness feature raises or lower the brightness of the screen depending
on the light in the current environment. For some reasons, developpers may disable this feature programmatically,
setting the field `WindowManager.LayoutParams#screenBrightness` with the constant `BRIGHTNESS_OVERRIDE_FULL`.
This intelligent feature was introduced to improve battery life. Its deactivation is a very bad idea.

## HTML

```html
<p>Introduced in Android 9, the adaptive brightness feature raises or lower the brightness of the screen depending on
    the light in the current environment.<br>
    For some reasons, developers may disable this feature programmatically, setting the field
    <code>WindowManager.LayoutParams#screenBrightness</code> with the constant <code>BRIGHTNESS_OVERRIDE_FULL</code>.
    <br>This feature was introduced to improve battery life, be careful when deactivating it.</p>
<h2>Noncompliant Code Example</h2>
<pre>
    getWindow().getAttributes().screenBrightness = BRIGHTNESS_OVERRIDE_FULL;
</pre>
```

## Implementation principle

- Visit the assignment nodes.
- Check that the assignment is an assignment of `android.view.WindowManager$LayoutParams screenBrightness` element.
- Check if the assignment is of kind `float literal`, `int literal`, `variable` or `identifier`.
- For each of these cases, try to get the value of the right operand of the assignment.
- If the value is `BRIGHTNESS_FULL_VALUE (1)`, thrown an issue on the assignment.
