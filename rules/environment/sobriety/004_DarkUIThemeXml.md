\newpage

# Sobriety: Dark UI (Theme)

## Platform

|   OS          |  OS version  |  Langage  |
|---------------|--------------|-----------|
| Android       |      -       |  XML      |

## Main caracteristics

|   ID     | Title                   | Category    | Sub-category   |
|----------|-------------------------|-------------|----------------|
| ESOB004  | Dark UI (Theme)         | Environment | Sobriety       |

## Severity / Remediation Cost

|  Severity  | Remediation Cost    |
|------------|---------------------|
| Major      | High                |

## Rule short description

Using a light theme may have a significant impact on energy consumption on (AM)OLED screens.

## Rule complete description

## Text

Developers are allowed to apply native themes for their app, or derive new ones throught inheritence. This decision
has a significant impact on energy consumption since displaying dark colors is particularly beneficial for mobile
devices with (AM)OLED screens.
By default Android will set Holo to the Dark theme (parent style`Theme.Holo`) and hence switching to the
light theme (parent style `Theme.Holo.Light`) within the manifest or in xml themes should be avoided.

## HTML

```html
<p>Developers are allowed to apply native themes for their app, or derive new ones throught inheritence. This decision
    has a significant impact on energy consumption since displaying dark colors is particularly beneficial for mobile
    devices with (AM)OLED screens.</br>
    By default Android will set Holo to the Dark theme (parent style <code>Theme.Holo</code>) and hence switching to the
    light theme (parent style <code>Theme.Holo.Light</code>) within the manifest or in xml themes should be avoided.</p>
<h2>Noncompliant Code Example</h2>
<pre>
&lt;style name="Theme.MyTheme" parent="@android:style/Theme.Holo.Light"/&gt;
</pre>
or
<pre>
&lt;application android:label="@string/app_name" android:theme="@android:style/Theme.Holo.Light"/&gt;
</pre>
<h2>Compliant Solution</h2>
<pre>
&lt;style name="Theme.MyTheme" parent="@android:style/Theme.Holo"/&gt;
</pre>
or
<pre>
&lt;application android:label="@string/app_name" android:theme="@android:style/Theme.Holo"/&gt;
</pre>
```

## Implementation principle

- Look in project xmls `styles` that inherit `Theme.Holo.Light` or `Theme.AppCompat.Light` themes
  (or other themes that begin by `Theme.Holo.Light` or `Theme.AppCompat.Light`
- Check themes set in the manifest that begin by `@android:style/Theme.Holo.Light` or `@style/Theme.AppCompat.Light`
