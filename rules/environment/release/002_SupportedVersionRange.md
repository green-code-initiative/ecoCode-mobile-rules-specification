\newpage

# Release: Supported Version Range

## Platform

|   OS          |  OS version  | Language |
|---------------|--------------|----------|
| Android       |      -       | Groovy   |

## Main characteristic

| ID      | Title                 | Category    | Sub-category |
|---------|-----------------------|-------------|--------------|
| EREL002 | SupportedVersionRange | Environment | Release      |

## Severity / Remediation Cost

| Severity | Remediation Cost |
|----------|------------------|
| Major    | Easy             |

## Rule short description

When looking at the minSdkVersion and targetSdkVersion attributes for the &lt;uses-sdk&gt; in the AndroidManifest.xml file, the amplitude of supported platform versions should not be too wide, at the risk of making the app too heavy to handle all cases.

## Rule complete description

## Text

When looking at the minSdkVersion and targetSdkVersion attributes for the &lt;uses-sdk&gt; in the AndroidManifest.xml file,
the amplitude of supported platform versions should not be too wide, at the risk of making the app too heavy to
handle all cases.

## HTML

```html
When looking at the <code>minSdkVersion<code> and <code>targetSdkVersion<code> attributes for the <code>&lt;uses-sdk&gt;</code>
in the AndroidManifest.xml file, the amplitude of supported platform versions should not be too wide, at the risk of making the app too heavy to
handle all cases.
<p>Example of violations:</p>
<pre>
    android {
        compileSdk 32

        defaultConfig {
            applicationId "com.example.sampleForSonar"
            minSdkVersion 26
            targetSdkVersion 31
            versionCode 1
            versionName "1.0"

            testInstrumentationRunner "androidx.test.runner.AndroidJUnitRunner"
        }

        buildTypes {
            release {
                minifyEnabled false
                proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
            }
        }
        compileOptions {
            sourceCompatibility JavaVersion.VERSION_1_8
            targetCompatibility JavaVersion.VERSION_1_8
        }
        buildFeatures {
            viewBinding true
        }
    }
</pre>
```

## Implementation principle

- In the build.gradle file check for the value of minSdkVersion and targetSdkVersion to verify the range. If the
range exceed a threshold an issue is triggered.
