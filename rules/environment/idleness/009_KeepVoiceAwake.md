\newpage

# Idleness: Keep Voice Awake

## Platform

|   OS          |  OS version  |  Langage  |
|---------------|--------------|-----------|
|  Android      |     5.0+     |  Java     |

## Main caracteristics

|   ID     | Title             | Category    | Sub-category   |
|----------|-------------------|-------------|----------------|
| EIDL009  | Keep Voice Awake  | Environment | Idleness       |

## Severity / Remediation Cost
  
|  Severity  | Remediation Cost    |
|------------|---------------------|
| Major      | Easy                |

## Rule short description

`VoiceInteractionSession.setKeepAwake(false)` should be called to limit battery drain.

## Rule complete description

## Text

During a voice interaction session, `VoiceInteractionSession#setKeepAwake(boolean keepAwake)` allows to decide whether
it will keep the device awake while it is running a voice activity.
By default, the system holds a wake lock for it while in this state, so that it can work even if the screen is off.
Setting this to `false` removes that wake lock, allowing the CPU to go to sleep and hence does not let this continue
to drain the battery.

## HTML

```html
<p>During a voice interaction session,
<code>VoiceInteractionSession#setKeepAwake(boolean keepAwake)</code> 
allows to decide whether it will keep the device awake while it is running a voice 
activity.</p>
<p>By default, the system holds a wake lock for it while in this state, so that it can 
work even if the screen is off. Setting this to <code>false</code> removes that wake 
lock, allowing the CPU to go to sleep and hence does not let this continue to drain 
the battery.</p>

<h2>Noncompliant Code Example</h2>
<pre>
  VoiceInteractionSession voiceSession = new VoiceInteractionSession(this);
</pre>
OR
<pre>
  VoiceInteractionSession voiceSession = new VoiceInteractionSession(this);
  voiceSession.setKeepAwake(true);
</pre>
</br>
<h2>Compliant Code Example</h2>
<pre>
  VoiceInteractionSession voiceSession = new VoiceInteractionSession(this);
  voiceSession.setKeepAwake(false);
</pre>
```

## Implementation principle

- Inspect new class node to find `new VoiceInteractionSession()` creation (from `android.service.voice`).
- Check if the method `setKeepAwake` is called.
  - if the method is not present: report an issue in the `new VoiceInteractionSession()` call
  - if the argument 0 of the method is `true` : report an issue in the `setKeepAwake()` call
