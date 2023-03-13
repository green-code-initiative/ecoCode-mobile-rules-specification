\newpage

# Privacy: Google Tracker

## Platform

|   OS          |  OS version  | Language |
|---------------|--------------|----------|
| Android       |      -       | Java     |

## Main characteristic

| ID      | Title                 | Category    | Sub-category |
|---------|-----------------------|-------------|--------------|
| SPRI002 | Google Tracker        | Social      | Privacy      |

## Severity / Remediation Cost

| Severity | Remediation Cost |
|----------|------------------|
| Minor    | Medium           |

## Rule short description

Using com.google.android.gms.analytics.* is a potential threat for privacy.

OR

Using com.google.firebase.analytics.* is a potential threat for privacy.

## Rule complete description

## Text

Importing the com.google.android.gms.analytics.Tracker or com.google.firebase.analytics.FirebaseAnalytics
classes means that the app sends hits to Google Analytics. It is not necessarily sensitive information,
but it is a first step towards Google Ads and hence this practice should be discouraged at early stage.

## HTML

```html
<p>
    Importing the <code>com.google.android.gms.analytics.Tracker</code> or 
    <code>com.google.firebase.analytics.FirebaseAnalytics</code> classes means 
    that the app sends hits to Google Analytics. It is not necessarily sensitive 
    information, but it is a first step towards Google Ads and hence this practice 
    should be discouraged at early stage.
</p>
<h2>Noncompliant Code Example</h2>
Import of Google Analytics :
<pre>
    import com.google.android.gms.analytics.Tracker
</pre>
Import of Firebase Analytics :
<pre>
    import com.google.firebase.analytics
</pre>
```

## Implementation principle

- In the imports of the Java file, search for the imports that start with `com.google.android.gms.analytics` or `com.google.firebase.analytics`.
