\newpage

# Leakage: Media Leak (MediaPlayer)

## Platform

|   OS     | OS version |  Langage  |
|----------|------------|-----------|
| Android  | -          |  Java     |

## Main caracteristics

|   ID     | Title                    | Category    | Sub-category |
|----------|--------------------------|-------------|--------------|
| ELEA006  | Media Leak (MediaPlayer) | Environment | Leakage      |

## Severity / Remediation Cost

| Severity | Remediation Cost |
|----------|------------------|
| Major    | Medium           |

## Rule short description

Failing to call `release()` on a Media Player may lead to continuous battery consumption.

## Rule complete description

### Text

Creation of a Media Player object with `new MediaPlayer()` is used to record audio and video. Class own a `release()` method.
In addition to unnecessary resources (such as memory and instances of codecs) being held, failure to call this method immediately
if a media object is no longer needed may also lead to continuous battery consumption for mobile devices.

### HMTL

```html
<p>Creation of a of a Media Player object with <code>new MediaPlayer()</code> can
    be used to control playback of audio/video files and streams. Class own a<code>release()</code> method.</p>
<p>In addition to unnecessary resources (such as memory and instances of codecs) being held,
    failure to call this method immediately if a media object is no longer needed may also lead to
    continuous battery consumption for mobile devices.</p>
<h2>Noncompliant Code Example</h2>
<pre>
MediaPlayer mp = new MediaPlayer();
</pre>
<h2>Compliant Solution</h2>
<pre>
MediaPlayer mp = new MediaPlayer();
mp.release();
</pre>
```

## Implementation principle

- Inspect new class node to find `new MediaPlayer()` creation (from `android.media`).
- Inspect method invocation node to find to find a `release()` method call from the same class (`MediaPlayer`).
- When leaving the file, checks if both `new android.media.MediaPlayer()` and `release()` was called in it.
- If not, throw an issue on each `new android.media.MediaPlayer()`.

> This implementation is quite simple and will give false positive in some cases. However it will quickly cover the
> majority of the cases.