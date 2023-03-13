\newpage

# Sobriety: Thrifty Notification

## Platform

|   OS          |  OS version  |  Langage  |
|---------------|--------------|-----------|
| Android       |      -       |  Java     |

## Main caracteristics

|   ID     | Title                 | Category    | Sub-category   |
|----------|-----------------------|-------------|----------------|
| ESOB012  | Thrifty Notification  | Environment | Sobriety       |

## Severity / Remediation Cost

|  Severity  | Remediation Cost |
|------------|------------------|
| Minor      | Trivial          |

## Rule short description

Avoid using vibration or sound when notifying the users to use less energy.

## Rule complete description

## Text

Giving informations to the end-user through notifications is an important aspect of a modern app.\
However, a notification does not necessarily need to be loud and vibrant to achieve its purpose.
Default mode is enough. That is why when building a notification with NotificationManager,
there should be no extra calls to the methods setVibrationPattern() nor setSound() on the builder object.

## HTML

```html
<p>Giving informations to the end-user through notifications is an important aspect of a modern app.<br>
    However, a notification does not necessarily need to be loud and vibrant to achieve its purpose.
    Default mode is enough. That is why when building a notification with
    <code>NotificationManager</code>
    there should be no extra calls to the methods <code>setSound()</code> nor
    <code>setVibrate()</code> (API26) nor <code>setVibrationPattern()</code> (API31) on the builder object.</p>
<h2>Noncompliant Code Example</h2>
API 26:
<pre>
    Notification.Builder notificationBuilder = new Notification.Builder(getApplicationContext(), "42");
    notificationBuilder.setVibrate(new long[] {1000, 1000, 1000, 1000, 1000});
    notificationBuilder.setSound(
        RingtoneManager.getDefaultUri(RingtoneManager.TYPE_NOTIFICATION),
        Notification.AUDIO_ATTRIBUTES_DEFAULT
    );
</pre>
API 31:
<pre>
    NotificationChannel notification = new NotificationChannel("42",
        "test",
        NotificationManager.IMPORTANCE_DEFAULT
    );
    notification.setVibrationPattern(new long[]{1000, 1000, 1000, 1000, 1000});
    notification.setSound(
        RingtoneManager.getDefaultUri(RingtoneManager.TYPE_NOTIFICATION),
        Notification.AUDIO_ATTRIBUTES_DEFAULT
    );
</pre>
```

## Implementation principle

- Checks that the methods `android.app.NotificationChannel#setVibrationPattern(long[])` or
  `android.app.NotificationChannel#setSound(Uri, AudioAttributes)` or
  `android.app.Notification.Builder.setVibrate(long[])` or
  `android.app.Notification.Builder.setSound(Uri, AudioAttributes)` or
  `android.app.Notification.Builder.setSound(Uri, int)` or
  `android.app.Notification.Builder.setSound(Uri)`
  are called with any parameters except when they're all `null`
