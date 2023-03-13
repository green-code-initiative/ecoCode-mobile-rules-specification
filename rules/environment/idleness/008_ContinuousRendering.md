\newpage

# Idleness: Continuous Rendering

## Platform

|   OS          |  OS version  |  Langage  |
|---------------|--------------|-----------|
|  Android      |       -      |  Java     |

## Main caracteristics

|   ID     | Title                 | Category    | Sub-category   |
|----------|-----------------------|-------------|----------------|
| EIDL008  | Continuous Rendering  | Environment | Idleness       |

## Severity / Remediation Cost
  
|  Severity  | Remediation Cost    |
|------------|---------------------|
| Minor      | Easy                |

## Rule short description

Using RENDERMODE_WHEN_DIRTY instead of RENDERMODE_CONTINUOUSLY can improve battery life.

## Rule complete description

## Text

For developers wishing to display OpenGL rendering, when choosing the rendering mode with
`GLSurfaceView#setRenderMode(int renderMode)`, using `RENDERMODE_WHEN_DIRTY` instead of
`RENDERMODE_CONTINUOUSLY` (by default) can improve battery life and overall system
performance by allowing the GPU and CPU to idle when the view does not need to be updated.

## HTML

```html
<p>For developers wishing to display OpenGL rendering, when choosing the rendering mode 
with <code>GLSurfaceView#setRenderMode(int renderMode)</code>, 
using <code>RENDERMODE_WHEN_DIRTY</code> instead of <code>RENDERMODE_CONTINUOUSLY</code>
(by default) can improve battery life and overall system performance by allowing the GPU 
and CPU to idle when the view does not need to be updated.</p>

<h2>Noncompliant Code Example</h2>
<pre>
  GLSurfaceView surfaceView = new GLSurfaceView(this);
  surfaceView.setRenderMode(GLSurfaceView.RENDERMODE_CONTINUOUSLY)
</pre>
<br>
<h2>Compliant Code Example</h2>
<pre>
  GLSurfaceView surfaceView = new GLSurfaceView(this);
  surfaceView.setRenderMode(GLSurfaceView.RENDERMODE_WHEN_DIRTY)
</pre>
```

## Implementation principle

- Look for `setRenderMode()` method invocations of type `android.opengl.GLSurfaceView`.
- If the argument is `1` report an issue.
