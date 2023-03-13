\newpage

# Idleness: Durable Wake Lock

## Platform

|   OS     | OS version |  Langage  |
|----------|------------|-----------|
| Android  |     -      |  Java     |

## Main caracteristics

|   ID     | Title             | Category    | Sub-category   |
|----------|-------------------|-------------|----------------|
| EIDL006  | Durable Wake Lock | Environment | Idleness       |

## Severity / Remediation Cost

| Severity | Remediation Cost |
|----------|------------------|
| Major    | Easy             |

## Rule short description

Prefer setting a timeout when acquiring a wake lock to avoid running down the device's
battery excessively.

## Rule complete description

## Text

A wake lock is a mechanism to indicate that your application needs to have the device stay on.
The general principle is to obtain a wake lock, acquire it and finally release it. Hence, the
challenge here is to release the lock as soon as possible to avoid running down the device's
battery excessively. Missing call to `PowerManager#release()` is a built-in check of Android
lint (Wakelock check) but that does not prevent abuse of the lock over a too long period of time.
This can be avoided by a call to `PowerManager#acquire(long timeout)` instead of `PowerManager#acquire()`,
because the lock will be released for sure after the given timeout expires.

## HTML

```html
<p>A wake lock is a mechanism to indicate that your application needs to have the device stay on. 
The general principle is to obtain a wake lock, acquire it and finally release it.</p> 
<p>Hence, the challenge here is to release the lock as soon as possible to avoid running down the device's 
battery excessively. Missing call to <code>PowerManager#release()</code> is a built-in check of Android 
lint (<i>Wakelock</i> check) but that does not prevent abuse of the lock over too long a period of time.</br> 
This can be avoided by a call to <code>PowerManager#acquire(long timeout)</code> instead of
<code>PowerManager#acquire()</code>, because the lock will be released for sure after the given timeout expires.</p>
<h2>Noncompliant Code Example</h2>
<pre>
<code>PowerManager.acquire()</code>
</pre>
<h2>Compliant Code Example</h2>
<pre>
<code>PowerManager.acquire(long timeout)</code>
</pre>
```

## Implementation principle

- Search for `android.os.PowerManager#acquire()` method invocation. Be sure that `acquire()` has no parameter.
