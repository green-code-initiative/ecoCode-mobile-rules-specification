\newpage

# Leakage: Media Leak (MediaRecorder)

## Platform

|   OS     | OS version |  Langage  |
|----------|------------|-----------|
| Android  | -          |  Java     |

## Main caracteristics

|   ID     | Title                      | Category    | Sub-category |
|----------|----------------------------|-------------|--------------|
| ELEA005  | Media Leak (MediaRecorder) | Environment | Leakage      |

## Severity / Remediation Cost

| Severity | Remediation Cost |
|----------|------------------|
| Major    | Medium           |

## Rule short description

Failing to call `release()` on a Media Recorder may lead to continuous battery consumption.

## Rule complete description

### Text

Creation of a Media Recorder object with `new MediaRecorder()` is used to record audio and video. Class own a `release()` method.
In addition to unnecessary resources (such as memory and instances of codecs) being held, failure to call this method immediately
if a media object is no longer needed may also lead to continuous battery consumption for mobile devices.

### HMTL

```html
<p>Creation of a Media Recorder object with <code>new MediaRecorder()</code> is used to record
    audio and video. Class own a <code>release()</code> method.</p>
<p>In addition to unnecessary resources (such as memory and instances of codecs) being held,
    failure to call this method immediately if a media object is no longer needed may also lead to
    continuous battery consumption for mobile devices.</p>
<h2>Noncompliant Code Example</h2>
<pre>
MediaRecorder mr = new MediaRecorder();
</pre>
<h2>Compliant Solution</h2>
<pre>
MediaRecorder mr = new MediaRecorder();
mr.release();
</pre>
```

## Implementation principle

- Inspect new class node to find `new MediaRecorder()` creation (from `android.media`).
- Inspect method invocation node to find `release()` method call.
- When leaving the file, checks if both `new android.media.MediaRecorder()` and `release()` was called in it.
- If not, throw an issue on each `new android.media.MediaRecorder()`.

> This implementation is quite simple and will give false positive in some cases. However it will quickly cover the
> majority of the cases.